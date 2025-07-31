import 'package:flutter/material.dart';
import 'package:fruit_hub/core/cubits/best_selling_products_cubit/best_selling_products_cubit.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_body_bloc_consumer.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      final isConnected = resultList.any((r) => r != ConnectivityResult.none);
      if (isConnected) {
        _reloadNetworkSensitiveData();
      }
    });
  }

  void _reloadNetworkSensitiveData() {
    // Trigger fetch for all Cubits that depend on network
    context.read<ProductsCubit>().getProducts();
    context.read<BestSellingProductsCubit>().getBestSellingProducts();
    // Add more Cubits if needed
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex),
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
//   int currentViewIndex = 0;

//   void onTabSelected(int index) {
//     setState(() {
//       currentViewIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex),
//       bottomNavigationBar: CustomButtonNavigationBar(
//         currentIndex: currentViewIndex,
//         onTap: onTabSelected,
//       ),
//     );
//   }
// }
