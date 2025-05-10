import OpenAI from "openai";
import openaiKey from "../utils/config";


const base_url = "https://api.aimlapi.com/v1";



const api = new OpenAI({
    apiKey: openaiKey,
    baseURL: base_url,
});

type Song = {
  title: string;
  artist: string;
  explanation: string;
};

export const generateMoodMusic = async (message: string): Promise<Song[]> => {
  try {
    const response = await api.chat.completions.create({
      model: 'mistralai/Mistral-7B-Instruct-v0.2',
      messages: [
        {
          role: 'user',
          content: `Suggest 5 songs that match the mood: "${message}". 
For each song, return a JSON object with the following fields:
- title (string)
- artist (string)
- explanation (string)

Return an array of 5 such JSON objects. Do not include any extra text.`
        }
      ],
      max_tokens: 600
    });

    const raw = response.choices[0]?.message?.content?.trim() || "[]";
    const songs = JSON.parse(raw) as Song[];

    console.log(songs);
    return songs;
  } catch (error) {
    console.error('Error generating list of music:', error);
    return [];
  }
};

