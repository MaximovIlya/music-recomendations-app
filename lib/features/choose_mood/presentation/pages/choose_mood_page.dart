import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_recomendations/core/theme.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_event.dart';
import 'package:music_recomendations/features/choose_mood/presentation/widgets/by_nature_button.dart';
import 'package:music_recomendations/features/choose_mood/presentation/widgets/mood_button.dart';
import 'package:music_recomendations/home_page.dart';

class ChooseMoodPage extends StatefulWidget {
  const ChooseMoodPage({super.key});

  @override
  State<ChooseMoodPage> createState() => _ChooseMoodPageState();
}

class _ChooseMoodPageState extends State<ChooseMoodPage> {
  String? message;
  String? nature;

  @override
  void initState() {
    super.initState();
  }

  void _chooseNature() {
    if (nature != null && nature!.isNotEmpty) {

    }
  }
  void _chooseMood() {
    print('test');
    if (message != null && message!.isNotEmpty) {
      BlocProvider.of<ChooseMoodBloc>(context).add(LoadChooseMood(message!));
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(initialIndex: 1),
      ),
    );
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
              Text(
                "What kind of music do you want to listen today?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 50),
              Text(
                "Your mood",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MoodButton(
                    text: 'Funny',
                    onPressed: () => setState(() => message = 'Funny'),
                    gradientColors: [
                      Colors.yellow,
                      Color.fromARGB(255, 44, 120, 47)
                    ],
                    isSelected: message == 'Funny',
                  ),
                  SizedBox(width: 20),
                  MoodButton(
                    text: 'Sad',
                    onPressed: () => setState(() => message = 'Sad'),
                    gradientColors: [
                      Color.fromARGB(255, 2, 61, 110),
                      Colors.deepPurple
                    ],
                    isSelected: message == 'Sad',
                  ),
                  SizedBox(width: 20),
                  MoodButton(
                    text: 'Fatigue',
                    onPressed: () => setState(() => message = 'Fatigue'),
                    gradientColors: [
                      Colors.blue,
                      Color.fromARGB(255, 87, 237, 234)
                    ],
                    isSelected: message == 'Fatigue',
                  ),
                  SizedBox(width: 20),
                  MoodButton(
                    text: 'In love',
                    onPressed: () => setState(() => message = 'In love'),
                    gradientColors: [Colors.pinkAccent, Colors.red],
                    isSelected: message == 'In love',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "By nature",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ByNatureButton(
                    text: 'Favorite',
                    icon: Icons.favorite,
                    onPressed: () => setState(() => nature = 'Favorite'),
                    gradientColors: [Colors.pinkAccent, Colors.red],
                    isSelected: nature == 'Favorite',
                  ),
                  SizedBox(width: 20),
                  ByNatureButton(
                    text: 'Unfamiliar',
                    icon: Icons.star,
                    onPressed: () => setState(() => nature = 'Unfamiliar'),
                    gradientColors: [Colors.orange, Colors.yellow],
                    isSelected: nature == 'Unfamiliar',
                  ),
                  SizedBox(width: 20),
                  ByNatureButton(
                    text: 'Popular',
                    icon: Icons.flash_on_rounded,
                    onPressed: () => setState(() => nature = 'Popular'),
                    gradientColors: [Colors.grey, Colors.white],
                    isSelected: nature == 'Popular',
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _chooseMood,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    "Choose a playlist",
                    style: GoogleFonts.alegreyaSans(
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
