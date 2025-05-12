import {Router} from 'express';
import { addFavorite, deleteFavorite, fetchFavorites } from '../controllers/favoriteController';
import { verifyToken } from "../middlewares/authMiddleware";

const router = Router();

router.post('/addFavorite', verifyToken, addFavorite);
router.post('/deleteFavorite', verifyToken, deleteFavorite);
router.get('/fetchFavorites', verifyToken, fetchFavorites);
export default router;