import 'package:flutter/material.dart';
import 'package:flutter_api/screens/video_screen.dart';

class MyHero extends StatelessWidget {
  final String imgUrl;

  const MyHero({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3.0),
      height: MediaQuery.of(context).size.height / 2.5,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            top: 0,
            child: ClipPath(
              clipper: CustomClip(),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black.withOpacity(.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Netflixy",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, VideoApp.route);
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 3.0,
                        offset: Offset(0, 1)),
                  ],
                ),
                padding: const EdgeInsets.all(15.0),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 31);
    path.quadraticBezierTo(
        size.width / 2, size.height + 31, size.width, size.height - 31);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClip oldClipper) {
    return true;
  }
}
