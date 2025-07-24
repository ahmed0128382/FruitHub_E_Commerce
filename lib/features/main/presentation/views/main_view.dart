import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_body_bloc_consumer.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex),
        bottomNavigationBar: CustomButtonNavigationBar(
          currentIndex: currentViewIndex,
          onTap: onTabSelected,
        ),
      ),
    );
  }
}
