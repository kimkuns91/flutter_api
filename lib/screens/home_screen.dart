import 'package:flutter/material.dart';
import 'package:flutter_api/api.dart';
import 'package:flutter_api/colors.dart';
import 'package:flutter_api/models/featured_movie_model.dart';
import 'package:flutter_api/models/genre_model.dart';
import 'package:flutter_api/widgets/featured_widget.dart';
import 'package:flutter_api/widgets/section_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FeaturedMovieModel>> featuredMovies;
  late Future<List<GenreModel>> genreList;
  late Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    featuredMovies = _api.getFeaturedMovies();
    genreList = _api.getGenreList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search, color: AppColors.text),
              onPressed: () {})
        ],
        leading: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.text),
            onPressed: () {}),
        title: const Text(
          "MouseFlix",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: FutureBuilder<List<FeaturedMovieModel>>(
                future: featuredMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomePageFeaturedWidget(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              height: 61,
              child: FutureBuilder<List<GenreModel>>(
                future: genreList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, id) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.red,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 2.5,
                              )
                            ],
                          ),
                          constraints: const BoxConstraints(minWidth: 150),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 5.0,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            snapshot.data![id].name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.apply(color: Colors.white),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SectionContainer(
              sectionTitle: "Popular on Netflixy",
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder<List<FeaturedMovieModel>>(
                  future: featuredMovies,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (ctx, id) {
                          return MovieContainer(snapshot: snapshot.data![id]);
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
