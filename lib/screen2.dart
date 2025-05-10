import 'package:flutter/material.dart';
import 'package:humai/SongCard.dart';
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Column(
                      
                   
                      children: const [
                      SongCard(name: "Имя1", author: "Автор1"),
                      SongCard(name: "Имя2", author: "Автор2"),
                      SongCard(name: "Имя3", author: "Автор3"),
                      SongCard(name: "Имя4", author: "Автор4"),
                      SongCard(name: "Имя5", author: "Автор5"),
                      ],
                  ),
                ),
            ),
                ),
            );
        }
        }
