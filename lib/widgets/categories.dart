 // Widget to display individual movie item
  import 'package:flutter/material.dart';
import 'package:movie_browsing/models/movie_model.dart';

Widget buildMovieItem(Movie movie) {
    return GestureDetector(
      onTap: () {
        // You can handle movie tap here, like navigating to details page
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
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }