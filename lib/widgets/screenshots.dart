import 'package:flutter/material.dart';
import 'package:flutter_api/widgets/section_container.dart';

class MyScreenshots extends StatelessWidget {
  const MyScreenshots({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionTitle: 'Screenshots',
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // itemCount: screenshots.length,
          itemBuilder: (ctx, id) {
            return Container(
              margin: const EdgeInsets.only(right: 11.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  // screenshots[id],
                  "",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
