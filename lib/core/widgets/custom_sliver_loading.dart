import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

class CustomSliverLoading extends StatelessWidget {
  const CustomSliverLoading(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: isLoading,
      child: child,
    );
  }
}
