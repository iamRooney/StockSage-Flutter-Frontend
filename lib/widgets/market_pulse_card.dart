import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';

class MarketPulseCard extends StatelessWidget {
  final String sentiment;
  final int confidence;
  final String description;

  const MarketPulseCard({
    super.key,
    required this.sentiment,
    required this.confidence,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MARKET PULSE",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    sentiment,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$confidence%",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "CONFIDENCE",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: confidence.toDouble(),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}