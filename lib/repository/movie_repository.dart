import 'dart:convert';

import 'package:movie_browsing/constants.dart/api_constants.dart';
import 'package:movie_browsing/models/movie_detail_model.dart';
import 'package:movie_browsing/models/movie_model.dart';
import 'package:http/http.dart' as https;
class MovieRepository {
  Future<List<Movie>> fetchMovies(int page) async {
    final response = await https.get(
      Uri.parse('${ApiConstants.baseUrl}/discover/movie?api_key=${ApiConstants.apiKey}&page=$page'),
      headers: {
        'Authorization': 'Bearer ${ApiConstants.apiKey}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List; 
      final List<Movie> movies = results.map((movieData){
        return Movie.fromJson(movieData);
      }).toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
  // Fetch movie details using the movie ID
  Future<MovieDetails> fetchMovieDetails(int movieId) async {
    final response = await https.get(
      Uri.parse('${ApiConstants.baseUrl}/movie/$movieId?api_key=${ApiConstants.apiKey}&language=en-US'),
      headers: {
        'Authorization': 'Bearer ${ApiConstants.apiKey}',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDetails.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}