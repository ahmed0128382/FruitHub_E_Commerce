import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/main/presentation/views/home_view.dart';
import 'package:fruit_hub/features/main/presentation/views/products_view.dart';
import 'package:fruit_hub/features/main/presentation/views/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IndexedStack(
        index: currentViewIndex,
        children: [
          const HomeView(),
          const ProductsView(),
          const CartView(),
          const ProfileView(),
        ],
      ),
    );
  }
}
