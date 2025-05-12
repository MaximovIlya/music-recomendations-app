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

export const generateMoodMusic = async (mood: string, favorites: string, nature: string): Promise<Song[]> => {

  var content = '';
  if (favorites != "") {
    content = `Suggest 10 random songs that match the mood: "${mood}" and are "${nature}" to "${favorites}".`;
  } else  {
    content = `Suggest 10 random songs that match the mood: "${mood}" and are "${nature}".`;
  }

  console.log('content: ', content);
  try {
    const response = await api.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'user',
          content: `"${content}". 
For each song, return a JSON object with the following fields:
- title (string)
- artist (string)
- explanation (string)

Return an array of 10 such JSON objects. Do not include any extra text.`
        }
      ],
      max_tokens: 1500
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

