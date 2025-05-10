import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_event.dart';
import 'package:music_recomendations/features/choose_mood/presentation/widgets/mood_button.dart';

class ChooseMoodPage extends StatefulWidget {
  const ChooseMoodPage({super.key});

  @override
  State<ChooseMoodPage> createState() => _ChooseMoodPageState();
}

class _ChooseMoodPageState extends State<ChooseMoodPage> {
  String? message;

  @override
  void initState() {
    super.initState();
  }

  void _chooseMood() {
    print('test');
    if (message != null && message!.isNotEmpty) {
      BlocProvider.of<ChooseMoodBloc>(context).add(LoadChooseMood(message!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("How are you doing today?", style: TextStyle(fontSize: 20)),
              SizedBox(height: 50),
              MoodButton(
                text: "Funny 😊",
                onPressed: () => setState(() => message = 'Funny'),
                color: Colors.yellow,
              ),
              SizedBox(height: 20),
              MoodButton(
                text: "Sad 😢",
                onPressed: () => setState(() => message = 'Sad'),
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              MoodButton(
                text: "Fatigue 😴",
                onPressed: () => setState(() => message = 'Fatigue'),
                color: const Color.fromARGB(255, 195, 163, 163),
              ),
              SizedBox(height: 20),
              MoodButton(
                text: "In love 😍",
                onPressed: () => setState(() => message = 'In love'),
                color: Colors.pink,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _chooseMood,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    "Choose a playlist",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
