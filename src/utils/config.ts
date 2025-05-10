import dotenv from 'dotenv';

dotenv.config(); 

const openaiKey = process.env.OPENAI_API_KEY; 
export default openaiKey;