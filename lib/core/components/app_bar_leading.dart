import 'package:flutter/material.dart';
import 'package:pc_url/core/configs/styles/app_colors.dart';
import 'package:pc_url/features/history/views/pages/history.dart';

class AppBarLeading extends StatefulWidget {
  const AppBarLeading({super.key});

  @override
  State<AppBarLeading> createState() => _AppBarLeadingState();
}

class _AppBarLeadingState extends State<AppBarLeading>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Alias"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Show History',
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), 
                  ),
                  backgroundColor: AppColors.secondary,
                  builder: (BuildContext context) {
                    return const History();
                  });
            },
          ),
        ]);
  }
}
