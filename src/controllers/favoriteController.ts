import { Request, Response } from 'express';

import pool from '../models/db';


export const addFavorite = async (req: Request, res: Response): Promise<any> => {
    let userId = null;
    if (req.user) {
        userId = req.user.id;
    }

    const {title, artist} = req.body;

    try{
        await pool.query(
            `
            INSERT INTO favorite (user_id, title, artist)
            VALUES ($1, $2, $3)
            ON CONFLICT DO NOTHING;
            `,
            [userId, title, artist]
        );

        return res.status(201).json({message: 'Song added to favorites'});
    } catch(error) {
        console.error('Error adding song: ', error);
        return res.status(500).json({error: 'Failed to add song to favorites'});
    }
}

export const deleteFavorite = async (req: Request, res: Response): Promise<any> => {
    let userId = null;
    if (req.user) {
        userId = req.user.id;
    }

    const {id} = req.body;

    try{
        await pool.query(
            `
            DELETE FROM favorite
            WHERE user_id = $1 AND id = $2
            `,
            [userId, id]
        );

        return res.status(201).json({message: 'Song deleted from favorites'});
    } catch(error) {
        console.error('Error deleting song: ', error);
        return res.status(500).json({error: 'Failed to delete song from favorites'});
    }
}


export const fetchFavorites = async (req: Request, res: Response): Promise<any> => {
    let userId = null;
    if (req.user) {
        userId = req.user.id;
    }

    try{
        const result = await pool.query(
            `
            SELECT * FROM favorite
            WHERE user_id = $1
            `,
            [userId]
        );

        return res.status(200).json(result.rows);
    } catch(error) {
        console.error('Error getting favorites: ', error);
        return res.status(500).json({error: 'Failed to get favorites'});
    }
}