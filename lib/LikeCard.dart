import 'package:flutter/material.dart';

class LikeCard extends StatelessWidget {
  final String name;
  final String author;
  final VoidCallback onDelete;

  const LikeCard({
    super.key,
    required this.name,
    required this.author,
    required this.onDelete,
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
            ElevatedButton.icon(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
