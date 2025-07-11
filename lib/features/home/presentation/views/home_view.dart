import 'package:flutter/material.dart';

import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context, title: 'الصفحة الرئيسية'),
      body: SafeArea(child: const HomeViewBody()),
    );
  }
}
