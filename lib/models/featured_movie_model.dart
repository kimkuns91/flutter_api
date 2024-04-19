class FeaturedMovieModel {
  final String originalTitle, overview, posterPath, releaseDate;
  final int id;
  final double rating;

  FeaturedMovieModel({
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.rating,
  });

  factory FeaturedMovieModel.fromJson(Map<String, dynamic> json) {
    return FeaturedMovieModel(
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        id: json['id'],
        releaseDate: json['release_date'],
        rating: json['vote_average']);
  }
}
