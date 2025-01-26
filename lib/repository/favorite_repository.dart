import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_browsing/models/movie_model.dart';

class FavoriteRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String collectionName = "favorite";
  
  
  //add fav movie to firebase 
  // in app the authentication is not implemented so i've saved fav movies globally so thats why it will be display to all users.
  
  Future<void> addFavMovie(Movie movie) async {
  // Simply store the movie's poster path (image URL) in Firestore
  await firebaseFirestore
      .collection(collectionName)
      .doc(movie.id.toString())
      .set(movie.toMap());
}

//remove Fav movie from collection 

  Future<void> removeFavMovie(int movieId) async {
    await firebaseFirestore
        .collection(collectionName)
        .doc(movieId.toString())
        .delete();
  }

  //fetching all fav movies from firebase 
  //snapshot is an object of class QuerySnapshot that fetch data of Map<String, dynamic>
  //so here snapshot is used to map all movies from firebase collection through fromJson function in Movie Model

  Future<List<Movie>> fetchFavMovies()async{
    var snapshot = await firebaseFirestore.collection(collectionName).get();
    return snapshot.docs.map((doc)=> Movie.fromJson(doc.data())).toList(); 
  }
}
