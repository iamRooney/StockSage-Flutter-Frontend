import 'package:flutter/material.dart';


class StockCard extends StatelessWidget {
  final String symbol;
  final String action;
  final int confidence;

  const StockCard({
    super.key,
    required this.symbol,
    required this.action,
    required this.confidence,
  });

  Color getActionColor() {
    if (action == "BUY") return Colors.greenAccent;
    if (action == "SELL") return Colors.redAccent;
    return Colors.amberAccent;
  }

    @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            symbol,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                action,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: getActionColor(),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Confidence: $confidence%",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}