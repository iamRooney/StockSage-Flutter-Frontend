import 'package:flutter/material.dart';

class SentimentGauge extends StatelessWidget {
  final double score;
  const SentimentGauge({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: CircularProgressIndicator(
        value: score,
        strokeWidth: 12,
      ),
    );
  }
}