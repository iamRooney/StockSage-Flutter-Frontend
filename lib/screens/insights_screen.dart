import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';
import 'package:stockapp/state/selected_stock.dart';
import 'package:stockapp/data/insight_news.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<String?>(
          valueListenable: selectedStock,
          builder: (context, symbol, _) {
            // ── ENTRY STATE ───────────────────────
            if (symbol == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search_rounded,
                      size: 48,
                      color: AppColors.muted,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Select a stock to view AI insights",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              );
            }

            // ── NORMAL INSIGHT STATE ──────────────
            return _InsightContent(symbol: symbol);
          },
        ),
      ),
    );
  }
}

class _InsightContent extends StatelessWidget {
  final String symbol;

  const _InsightContent({required this.symbol});

  @override
  Widget build(BuildContext context) {
    final relatedNews = insightNewsMap[symbol] ?? [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title ─────────────────────────────
          Text(
            "AI Insight • $symbol",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          // ── Main Decision Card ─────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "BUY",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Confidence: 78%",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.muted,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Technical indicators and stock-specific news sentiment support this recommendation.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Supporting Signals ─────────────────
          const Text(
            "Supporting Signals",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _signalTile("RSI", "62", "Neutral"),
          _signalTile("MACD", "Bullish", "Positive"),
          _signalTile("Volume", "High", "Supportive"),

          // ── Related News ──────────────────────
          if (relatedNews.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Text(
              "Related News",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...relatedNews.map(_newsTile),
          ],
        ],
      ),
    );
  }

  Widget _signalTile(String title, String value, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _newsTile(InsightNews news) {
    final Color color = news.sentiment == "Bullish"
        ? Colors.greenAccent
        : news.sentiment == "Bearish"
            ? Colors.redAccent
            : Colors.orangeAccent;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.headline,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  news.sentiment,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}