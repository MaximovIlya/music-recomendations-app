import 'package:flutter/material.dart';
import 'package:music_recomendations/features/choose_mood/presentation/pages/choose_mood_page.dart';
import 'package:music_recomendations/features/favorite/presentation/pages/favorite_page.dart';
import 'package:music_recomendations/features/recomendations/presentation/pages/recomendations_page.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<HomePage> {
  late int _currentIndex;

  final List<Widget> _pages = [
    ChooseMoodPage(),
    RecomendationsPage(),
    FavoritePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          selectedFontSize: 1,
          unselectedFontSize: 1,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.music_note), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.playlist_play), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
