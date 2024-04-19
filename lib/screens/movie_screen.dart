import 'package:flutter/material.dart';
import 'package:flutter_api/api.dart';
import 'package:flutter_api/models/featured_movie_model.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<FeaturedMovieModel>> movies;
  late Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    movies = _api.getFeaturedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Movies Demo"),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (BuildContext context,
            AsyncSnapshot<List<FeaturedMovieModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<FeaturedMovieModel> movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(movies[index].originalTitle),
                      subtitle: Text("ID: ${movies[index].id}"));
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
