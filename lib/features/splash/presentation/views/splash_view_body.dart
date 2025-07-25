import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruit_hub/features/main/presentation/views/main_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppImages.imagesPlantInject),
          ],
        ),
        SvgPicture.asset(AppImages.imagesFruitHub),
        SvgPicture.asset(
          AppImages.imagesCircles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = PrefS.getBool(kisOnBoardingViewSeen);
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      if (isOnBoardingViewSeen) {
        var isSignedIn = FirebaseAuthService().isSignedIn();
        if (isSignedIn) {
          Navigator.of(context).pushReplacementNamed(MainView.routeName);
        } else {
          Navigator.of(context).pushReplacementNamed(SignInView.routeName);
        }
      } else {
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
      }
    });
  }
}
