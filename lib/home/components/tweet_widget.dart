import 'package:flutter/material.dart';

import '../models/home_timeline.dart';

class TweetWidget extends StatelessWidget {
  final Tweet tweet;
  const TweetWidget({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tweet.text ?? '',
          textAlign: TextAlign.start,
        ),
        const Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
      ],
    );
  }
}
