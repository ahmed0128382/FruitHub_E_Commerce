import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';
import 'package:fruit_hub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_button_navigation_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'bestSelling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        title: 'الأكثر مبيعًا',
      ),
      bottomNavigationBar: const CustomButtonNavigationBar(),
      body: const BestSellingViewBody(),
    );
  }
}
