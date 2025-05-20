import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
import pool from '../config/dbConnectivity.js'; // PostgreSQL pool import karo

dotenv.config();

export const sendContactEmail = async (req, res) => {
  const { name, email, message } = req.body;

  try {
    // 1. Verify Database connection
    const dbConnectionTest = await pool.query('SELECT NOW()');
    console.log('Database is connected:', dbConnectionTest.rows);

    // 2. Email bhejna
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

    // 3. PostgreSQL mein insert karna
    const query = 'INSERT INTO contact (name, email, message) VALUES ($1, $2, $3)';
    const values = [name, email, message];
    await pool.query(query, values);

    res.status(200).json({ message: 'Message sent and saved successfully!' });

  } catch (error) {
    console.error("Database error: ", error);
    res.status(500).json({ error: 'Error processing request: ' + error.message });
  }
};
