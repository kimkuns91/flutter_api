import 'package:flutter/material.dart';
import 'package:flutter_api/global.dart';
import 'package:flutter_api/models/movie_model.dart';
import 'package:flutter_api/widgets/hero.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../api.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Api _api;
  late Future<MovieModel> movieModel;
  @override
  void initState() {
    _api = Api();
    movieModel = _api.getMovieInfo(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<MovieModel>(
          future: movieModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MyHero(
                      imgUrl: getPosterImage(snapshot.data!.posterPath),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data!.originalTitle,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          RichText(
                            text: TextSpan(
                              children: List.generate(
                                snapshot.data!.genre.length,
                                (i) {
                                  return TextSpan(
                                      text:
                                          "${snapshot.data!.genre[i]['name']} ");
                                },
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(height: 9.0),
                          RatingBar.builder(
                            initialRating: snapshot.data!.rating,
                            // initialRating: 3,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 25,
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                          ),
                          const SizedBox(height: 13.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Year",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    "${DateTime.parse(snapshot.data!.releaseDate).year}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Country",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    snapshot.data!.country,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Length",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    "${snapshot.data!.runTime} min",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 13.0),
                          Text(
                            snapshot.data!.overview,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(fontSizeFactor: 1.2),
                          ),
                          const SizedBox(height: 13.0),
                        ],
                      ),
                    ),
                    // MyScreenshots(),
                    const SizedBox(height: 13.0),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
