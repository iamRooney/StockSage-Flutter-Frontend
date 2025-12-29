import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';

class MiniNewsTile extends StatelessWidget {
  final String headline;
  final String sentiment;

  const MiniNewsTile({
    super.key,
    required this.headline,
    required this.sentiment,
  });

  Color get sentimentColor {
    switch (sentiment) {
      case "Positive":
        return Colors.greenAccent;
      case "Negative":
        return Colors.redAccent;
      default:
        return Colors.orangeAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // 🔒 fixed height = square feel
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headline
          Text(
            headline,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          // Sentiment pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: sentimentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              sentiment,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: sentimentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}