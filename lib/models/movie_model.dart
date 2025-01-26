class Movie {
   int id;
   String title;
   String posterPath;

  Movie({required this.id, required this.title, required this.posterPath});
   
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id']??0,
      title: json['title']??"",
      posterPath: json['poster_path']??"",
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': 'https://image.tmdb.org/t/p/w500${posterPath}', /* passing link with the extension in field to display an image because 
                                                                        in firebase only the path with jpg extension was passing, 
                                                                        which was not displaying image on screen.  */
    };
  }
}