import 'package:flutter/material.dart';
import 'package:flutter_api/colors.dart';
import 'package:flutter_api/global.dart';
import 'package:flutter_api/models/featured_movie_model.dart';

class HomePageFeaturedWidget extends StatelessWidget {
  final AsyncSnapshot<List<FeaturedMovieModel>> snapshot;
  const HomePageFeaturedWidget({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: (ctx, id) {
        return Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.grey.shade400,
                  offset: const Offset(0, 3))
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    getPosterImage(snapshot.data![id].posterPath),
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
                    snapshot.data![id].originalTitle,
                    style: const TextStyle(
                      color: AppColors.text,
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
        );
      },
    );
  }
}
