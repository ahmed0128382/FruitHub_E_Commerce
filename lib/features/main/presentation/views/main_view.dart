import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context, title: 'الصفحة الرئيسية'),
      bottomNavigationBar: const CustomButtonNavigationBar(),
      body: SafeArea(child: const HomeView()),
    );
  }
}
