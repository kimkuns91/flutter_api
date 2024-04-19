import 'package:flutter/material.dart';
import 'package:flutter_api/global.dart';
import 'package:flutter_api/models/featured_movie_model.dart';
import 'package:flutter_api/screens/details_screen.dart';

class MovieContainer extends StatelessWidget {
  final FeaturedMovieModel snapshot;

  const MovieContainer({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => DetailsScreen(id: snapshot.id),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey.shade400,
                offset: Offset(0, 3))
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  // movieList[id]['img'],
                  getPosterImage(snapshot.posterPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Text(
                  // "${movieList[id]['title']}",
                  snapshot.originalTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
