import 'dart:convert';
import 'package:flutter_api/models/featured_movie_model.dart';
import 'package:flutter_api/models/genre_model.dart';
import 'package:flutter_api/models/movie_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String url = "api.themoviedb.org";
  static const String apiKey = "7d6e4fe2b9ff796e960c86590ca5a1bc";

  Future<List<FeaturedMovieModel>> getFeaturedMovies() async {
    Uri uri = Uri.https(url, '/3/trending/movie/day', {'api_key': apiKey});
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(res.body);
      List<dynamic> results = jsonMap['results'];
      List<FeaturedMovieModel> movies =
          results.map((data) => FeaturedMovieModel.fromJson(data)).toList();
      return movies;
    } else {
      throw Exception("Unable to retrieve movies."); // 요청이 실패하면 예외를 발생시킵니다.
    }
  }

  Future<List<GenreModel>> getGenreList() async {
    Uri uri = Uri.https(url, '/3/genre/movie/list', {'api_key': apiKey});
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(res.body);
      List<dynamic> results = jsonMap['genres'];
      List<GenreModel> genres =
          results.map((data) => GenreModel.fromJson(data)).toList();
      return genres;
    } else {
      throw Exception("Unable to retrieve movies."); // 요청이 실패하면 예외를 발생시킵니다.
    }
  }

  Future<MovieModel> getMovieInfo(int movieId) async {
    Uri uri = Uri.https(url, '/3/movie/$movieId', {'api_key': apiKey});
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      return MovieModel.fromJson(json.decode(res.body));
    } else {
      throw Exception("Unable to retrieve movies."); // 요청이 실패하면 예외를 발생시킵니다.
    }
  }
}
