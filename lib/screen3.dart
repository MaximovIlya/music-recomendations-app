import 'package:flutter/material.dart';
import 'LikeCard.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<Map<String, String>> likedSongs = [
    {'name': 'Bohemian Rhapsody', 'author': 'Queen'},
    {'name': 'Imagine', 'author': 'John Lennon'},
    {'name': 'Hotel California', 'author': 'Eagles'},
  ];

  void _deleteSong(int index) {
    setState(() {
      likedSongs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              children: List.generate(
                likedSongs.length,
                (index) {
                  final song = likedSongs[index];
                  return LikeCard(
                    name: song['name']!,
                    author: song['author']!,
                    onDelete: () => _deleteSong(index),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
