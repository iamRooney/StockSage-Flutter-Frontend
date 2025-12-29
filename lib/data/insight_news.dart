class InsightNews {
  final String headline;
  final String sentiment; // Bullish / Bearish / Neutral

  const InsightNews({
    required this.headline,
    required this.sentiment,
  });
}

const Map<String, List<InsightNews>> insightNewsMap = {
  "AAPL": [
    InsightNews(
      headline: "Apple reports strong iPhone demand in Q3",
      sentiment: "Bullish",
    ),
    InsightNews(
      headline: "Services revenue growth boosts investor confidence",
      sentiment: "Bullish",
    ),
  ],

  "TSLA": [
    InsightNews(
      headline: "Tesla margins pressured by price cuts",
      sentiment: "Bearish",
    ),
    InsightNews(
      headline: "EV demand growth shows signs of slowing",
      sentiment: "Bearish",
    ),
  ],

  "NVDA": [
    InsightNews(
      headline: "AI chip demand drives record revenue outlook",
      sentiment: "Bullish",
    ),
    InsightNews(
      headline: "Data center expansion fuels long-term optimism",
      sentiment: "Bullish",
    ),
  ],

  "AMZN": [
    InsightNews(
      headline: "AWS growth stabilizes after recent slowdown",
      sentiment: "Neutral",
    ),
  ],
};