class MovieModel {
  final String originalTitle, overview, posterPath, country, releaseDate;
  final int id, runTime;
  final double rating;
  final List genre;

  MovieModel(
      {required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.country,
      required this.releaseDate,
      required this.id,
      required this.runTime,
      required this.rating,
      required this.genre});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        id: json['id'],
        country: json['production_companies'][0]['origin_country'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        genre: json['genres'],
        rating: json['vote_average']);
  }
}
