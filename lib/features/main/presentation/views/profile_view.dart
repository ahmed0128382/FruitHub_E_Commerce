import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int currentViewIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        title: 'حسابي',
      ),
      // bottomNavigationBar: CustomButtonNavigationBar(
      //   currentIndex: currentViewIndex,
      //   onTap: onTabSelected,
      // ),
      body: ProfileViewBody(),
    );
  }
}
