import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String name;
  final String author;

  const SongCard({
    super.key,
    required this.name,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100], 
        border: Border.all(color: Colors.lightBlueAccent, width: 3),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              author,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Do you like this song?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.thumb_up),
                  label: const Text("Like"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.thumb_down),
                  label: const Text("Dislike"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
