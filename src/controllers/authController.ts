import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import pool from '../models/db';

const SALT_ROUNDS = 10;
const JWT_SECRET = process.env.JWT_SECRET || 'chatsecretkey';


export const register = async(req: Request, res: Response) => {

    const {username, email, password} = req.body;
    try {
        const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
        const testDbConnection = async () => {
            try {
                await pool.query('SELECT NOW()');
                console.log("Database connection is working.");
            } catch (error) {
                console.error("Database connection failed:", error);
            }
        };
        testDbConnection();
        
        const result = await pool.query(
            'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *',
            [username, email, hashedPassword]
        );
        const user = result.rows[0];
        res.status(201).json({user});
    } catch (error) {
        res.status(500).json({error: 'Failed to register user'});
        console.error(error)
    }

}

export const login = async(req: Request, res: Response): Promise<any> => {

    const { email, password } = req.body;
    try {
        const result = await pool.query(
            'SELECT * FROM users WHERE email = $1',
            [email]
        );
        const user = result.rows[0];
        if (!user) return res.status(404).json({error: 'User not found'});

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({error: 'invalid credentials'});

        const token = jwt.sign({id: user.id}, JWT_SECRET, {expiresIn: '10h'});

        let finalResult = {...user, token}
        res.json({user: finalResult});
    } catch (error) {
        res.status(500).json({error: 'Failed to log in'});
    }
}