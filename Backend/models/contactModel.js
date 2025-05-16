import connection from '../config/mysqlConnectivity.js';

export const saveContact = (name, email, message, callback) => {
  const sql = 'INSERT INTO contact (name, email, message) VALUES (?, ?, ?)';
  connection.query(sql, [name, email, message], callback);
};