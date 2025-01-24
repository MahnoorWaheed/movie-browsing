 // Widget to display individual movie item
  import 'package:flutter/material.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/screens/movie_detail_screen.dart';

Widget buildMovieItem(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailscreen(id: movie.id),
      ),
    );
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: const TextStyle( fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }