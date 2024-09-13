import 'package:flutter/material.dart';
import 'package:musicapp/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      tabs: FoodCategories.values.map((category) {
        return Tab(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category.toString().split('.').last.toLowerCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
      labelColor: theme.colorScheme.surface,
      unselectedLabelColor: theme.colorScheme.primary.withOpacity(0.7),
      indicator: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}