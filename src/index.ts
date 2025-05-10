import express, { Request, Response } from 'express';
import {json} from 'body-parser';
import http from 'http';
import authRoutes from './routes/authRoutes';
import { error } from 'console';
import {Server} from 'socket.io';
import { generateMoodMusic } from './services/openaiService';


//import './cron/cronJob';



const app = express();
const server = http.createServer(app);
app.use(json());
const io = new Server(server, {
    cors:{
        origin: '*'
    }
})


app.use('/auth', authRoutes);

io.on('connection', (socket)=> {
    console.log('A user connected:', socket.id);

    socket.on('generateMusic', async (message) => {
        try {
            const musicList = await generateMoodMusic(message);
            console.log('musicList: ', musicList);
            socket.emit('musicListCreated', musicList);
        } catch(err) {
            console.error('Failed to create a list of musics: ', err);
        }
    })
})


const PORT = process.env.PORT || 6000;
server.listen(PORT, ()=> {
    console.log(`Server is running on port ${PORT}`);
})