import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/get_user.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
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

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = getUser();

    return Scaffold(
      appBar: appBarWidget(
        context,
        title: _getTitleForIndex(currentViewIndex),
      ),
      bottomNavigationBar: CustomButtonNavigationBar(
        currentIndex: currentViewIndex,
        onTap: onTabSelected,
      ),
      body: IndexedStack(
        index: currentViewIndex,
        children: [
          const BestSellingViewBody(),
          const ProductsViewBody(),
          const CartViewBody(),
          ProfileViewBody(user: userEntity),
        ],
      ),
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
