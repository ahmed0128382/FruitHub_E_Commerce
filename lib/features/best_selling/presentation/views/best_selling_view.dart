import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';
import 'package:fruit_hub/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_view_body.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/products_view_body.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/profile_view_body.dart';

class BestSellingView extends StatefulWidget {
  const BestSellingView({super.key});
  static const String routeName = 'bestSelling';

  @override
  State<BestSellingView> createState() => _BestSellingViewState();
}

class _BestSellingViewState extends State<BestSellingView> {
  int currentViewIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  Widget getCurrentViewBody() {
    return [
      const BestSellingViewBody(), // ✅ فقط Body، مش الصفحة نفسها
      const ProductsViewBody(),
      const CartViewBody(),
      const ProfileViewBody(),
    ][currentViewIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        title: _getTitleForIndex(currentViewIndex),
      ),
      bottomNavigationBar: CustomButtonNavigationBar(
        currentIndex: currentViewIndex,
        onTap: onTabSelected,
      ),
      body: getCurrentViewBody(),
    );
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'الأكثر مبيعًا';
      case 1:
        return 'المنتجات';
      case 2:
        return 'السلة';
      case 3:
        return 'الملف الشخصي';
      default:
        return '';
    }
  }
}
