import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/main/presentation/views/products_view.dart';
import 'package:fruit_hub/features/main/presentation/views/profile_view.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  Widget getCurrentView() {
    return [
      const HomeView(),
      const ProductsView(),
      const CartView(),
      const ProfileView(),
    ][currentViewIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getCurrentView()),
      bottomNavigationBar: CustomButtonNavigationBar(
        currentIndex: currentViewIndex,
        onTap: onTabSelected,
      ),
    );
  }
}

// class MainView extends StatefulWidget {
//   const MainView({super.key});
//   static const String routeName = 'main';

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: buildAppBar(context, title: 'الصفحة الرئيسية'),
//       bottomNavigationBar: const CustomButtonNavigationBar(),
//       body: SafeArea(child: const HomeView()),
//     );
//   }
// }
