import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';

// Existing widgets you already use
import 'package:stockapp/widgets/market_pulse_card.dart';
import 'package:stockapp/widgets/asset_tile.dart';

// New mini news tile (square)
import 'package:stockapp/widgets/mini_news_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────
            const Text(
              "StockSage",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ── Market Pulse ──────────────────────
            const MarketPulseCard(
              sentiment: "Bullish",
              confidence: 82,
              description:
                  "Markets are showing strong upward momentum. Buying volume is increasing across tech and retail sectors.",
            ),

            const SizedBox(height: 24),

            // ── Trending Assets ───────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Trending Assets",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "SEE ALL",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const AssetTile(
              symbol: "NVDA",
              action: "SAGE BUY",
              price: 145.20,
              change: 3.2,
            ),
            const AssetTile(
              symbol: "TSLA",
              action: "AVOID",
              price: 210.10,
              change: -1.5,
            ),
            const AssetTile(
              symbol: "AAPL",
              action: "NEUTRAL",
              price: 190.50,
              change: 0.4,
            ),

            const SizedBox(height: 28),

            // ── Top News (SQUARE TILES) ────────────
            const Text(
              "Top News",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MiniNewsTile(
                  headline: "Tech stocks rally amid market optimism",
                  sentiment: "Positive",
                ),
                MiniNewsTile(
                  headline: "Federal rate decision awaited by investors",
                  sentiment: "Neutral",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}