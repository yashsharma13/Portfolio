import pool from '../config/dbConnectivity.js';

export const saveContact = async (name, email, message) => {
  const sql = 'INSERT INTO contact (name, email, message) VALUES ($1, $2, $3)';
  const values = [name, email, message];
  return pool.query(sql, values); // returns a promise
};
