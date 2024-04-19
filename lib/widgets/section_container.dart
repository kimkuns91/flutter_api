import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final String sectionTitle;
  const SectionContainer(
      {super.key, required this.child, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                sectionTitle,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 15.0),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          child,
        ],
      ),
    );
  }
}
