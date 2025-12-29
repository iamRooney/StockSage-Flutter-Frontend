import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // ── Title ─────────────────────────────
              Text(
                "Market News",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // ── News Cards ───────────────────────
              NewsCard(
                source: "Financial Times",
                time: "45 min ago",
                headline: "Tech stocks rally amid market optimism",
                sentiment: "Positive",
                impact:
                    "Positive sentiment is driving buying interest in large-cap technology stocks.",
              ),

              NewsCard(
                source: "Reuters",
                time: "2 hrs ago",
                headline: "Federal rate decision awaited by investors",
                sentiment: "Neutral",
                impact:
                    "Markets remain cautious as investors wait for clarity on interest rate policy.",
              ),

              NewsCard(
                source: "Bloomberg",
                time: "4 hrs ago",
                headline: "Energy sector sees mixed performance",
                sentiment: "Negative",
                impact:
                    "Rising costs and demand uncertainty are pressuring energy stocks.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String source;
  final String time;
  final String headline;
  final String sentiment;
  final String impact;

  const NewsCard({
    super.key,
    required this.source,
    required this.time,
    required this.headline,
    required this.sentiment,
    required this.impact,
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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Source Row ────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                source,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ── Headline ─────────────────────────
          Text(
            headline,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // ── Sentiment Pill ───────────────────
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: sentimentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              sentiment,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: sentimentColor,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Impact Text ──────────────────────
          Text(
            impact,
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