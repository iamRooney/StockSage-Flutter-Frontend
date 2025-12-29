import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';
import 'package:stockapp/state/selected_stock.dart';

class SearchScreen extends StatelessWidget {
  final Function(int) onNavigate;

  const SearchScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ─────────────────────────────
            const Text(
              "Search Stocks",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ── Search Bar ────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppColors.muted),
                  hintText: "Search by company or symbol",
                  hintStyle: TextStyle(color: AppColors.muted),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Popular Section ───────────────────
            const Text(
              "Popular",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ── Stock List ────────────────────────
            Expanded(
              child: ListView(
                children: [
                  _StockTile(
                    symbol: "AAPL",
                    name: "Apple Inc.",
                    onTap: () {
                      selectedStock.value = "AAPL";
                      onNavigate(3); // INSIGHTS
                    },
                  ),
                  _StockTile(
                    symbol: "NVDA",
                    name: "NVIDIA Corp.",
                    onTap: () {
                      selectedStock.value = "NVDA";
                      onNavigate(3);
                    },
                  ),
                  _StockTile(
                    symbol: "TSLA",
                    name: "Tesla Inc.",
                    onTap: () {
                      selectedStock.value = "TSLA";
                      onNavigate(3);
                    },
                  ),
                  _StockTile(
                    symbol: "MSFT",
                    name: "Microsoft",
                    onTap: () {
                      selectedStock.value = "MSFT";
                      onNavigate(3);
                    },
                  ),
                  _StockTile(
                    symbol: "AMZN",
                    name: "Amazon",
                    onTap: () {
                      selectedStock.value = "AMZN";
                      onNavigate(3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockTile extends StatelessWidget {
  final String symbol;
  final String name;
  final VoidCallback onTap;

  const _StockTile({
    required this.symbol,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.muted,
            ),
          ],
        ),
      ),
    );
  }
}