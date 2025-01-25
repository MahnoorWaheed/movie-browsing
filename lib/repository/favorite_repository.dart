import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_browsing/models/movie_model.dart';

class FavoriteRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String collectionName = "favorite";
  
  

  Future<void> addFavMovie(Movie movie) async {
  // Simply store the movie's poster path (image URL) in Firestore
  await firebaseFirestore
      .collection(collectionName)
      .doc(movie.id.toString())
      .set(movie.toMap());
}


  Future<void> removeFavMovie(int movieId) async {
    await firebaseFirestore
        .collection(collectionName)
        .doc(movieId.toString())
        .delete();
  }

  Future<List<Movie>> fetchFavMovies()async{
    var snapshot = await firebaseFirestore.collection(collectionName).get();
    print("fetched movies are: ${snapshot.docs.first}");
    return snapshot.docs.map((doc)=> Movie.fromJson(doc.data())).toList(); 
  }
}
