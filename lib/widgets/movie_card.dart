import 'package:flutter/material.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:movie_browsing/screens/movie_detail_screen.dart';
import 'package:movie_browsing/widgets/fav_button.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailscreen(id: movie.id),
                ),
              );
            },
            child: Hero(
              tag: movie.id,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                  
                  FavoriteButton(
                      movie: movie),
                ],
              ),
            ),
          ),
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold,
            
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
