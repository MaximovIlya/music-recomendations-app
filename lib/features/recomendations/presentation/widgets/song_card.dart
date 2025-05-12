import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_recomendations/core/theme.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_event.dart';

class SongCard extends StatefulWidget {
  final String title;
  final String artist;
  final bool isInitiallyFavorite;
  final String? songId;

  const SongCard(
      {super.key,
      this.songId,
      required this.title,
      required this.artist,
      required this.isInitiallyFavorite});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isInitiallyFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = context.read<FavoriteBloc>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: DefaultColors.greyParts,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.alegreyaSans(
                    fontSize: FontSizes.medium,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.artist,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              onPressed: () {
              if (isFavorite && widget.songId != null) {
                favoriteBloc.add(DeleteFavorite(id: widget.songId!)); 
              } else {
                favoriteBloc.add(AddFavorite(title: widget.title, artist: widget.artist)); 
              }
              setState(() => isFavorite = !isFavorite);
            },
            ),
          ],
        ),
      ),
    );
  }
}
