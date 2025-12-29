import 'package:flutter/material.dart';

import 'package:stockapp/theme/app_theme.dart';
import 'package:stockapp/theme/app_colors.dart';

import 'package:stockapp/screens/dashboard_screen.dart';
import 'package:stockapp/screens/news_screen.dart';
import 'package:stockapp/screens/search_screen.dart';
import 'package:stockapp/screens/insights_screen.dart';

import 'package:stockapp/widgets/custom_bottom_dock.dart';

class StockApp extends StatefulWidget {
  const StockApp({super.key});

  @override
  State<StockApp> createState() => _StockAppState();
}

class _StockAppState extends State<StockApp> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const DashboardScreen(), // 0 → HOME
      const NewsScreen(),      // 1 → NEWS
      SearchScreen(
        onNavigate: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),                        // 2 → SEARCH
      const InsightsScreen(),  // 3 → INSIGHTS
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // ── Screen Content ────────────────────
            IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),

            // ── Floating Bottom Dock (LOCKED) ─────
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: SafeArea(
                top: false,
                child: CustomBottomDock(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}