import 'package:flutter/material.dart';
import 'package:stockapp/theme/app_colors.dart';

class AssetTile extends StatelessWidget {
  final String symbol;
  final String action;
  final double price;
  final double change;

  const AssetTile({
    super.key,
    required this.symbol,
    required this.action,
    required this.price,
    required this.change,
  });

  Color get changeColor => change >= 0 ? AppColors.accent : AppColors.danger;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.border,
            child: Text(
              symbol[0],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      symbol,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        action,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "HIGH ACTIVITY",
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${change >= 0 ? '+' : ''}${change.toStringAsFixed(1)}%",
                style: TextStyle(
                  fontSize: 12,
                  color: changeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}