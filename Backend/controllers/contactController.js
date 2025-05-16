import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
import connection from '../config/mysqlConnectivity.js';  // ye import add karo

dotenv.config();

export const sendContactEmail = async (req, res) => {
  const { name, email, message } = req.body;

  try {
    // 1. Pehle email bhejo
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
      }
    });

    const mailOptions = {
      from: `"Portfolio Contact" <${email}>`,
      to: process.env.EMAIL_USER,
      subject: '📬 New Contact Form Message',
      html: `
        <h3>New Message from Portfolio</h3>
        <p><strong>Name:</strong> ${name}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Message:</strong><br/>${message}</p>
      `
    };

    await transporter.sendMail(mailOptions);

    // 2. Email bhejne ke baad database me save karo
    const query = 'INSERT INTO contact (name, email, message) VALUES (?, ?, ?)';
    connection.query(query, [name, email, message], (err, results) => {
      if (err) {
        console.error('Database insert error:', err);
        return res.status(500).json({ error: 'Database error while saving message' });
      }

      // Dono email bhejna aur DB me save karna successful
      res.status(200).json({ message: 'Message sent and saved successfully!' });
    });

  } catch (error) {
    res.status(500).json({ error: 'Error sending message: ' + error.message });
  }
};
