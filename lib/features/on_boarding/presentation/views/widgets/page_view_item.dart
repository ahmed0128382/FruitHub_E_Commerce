import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.isVisible});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              GestureDetector(
                onTap: () {
                  PrefS.setBool(kisOnBoardingViewSeen, true);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginView.routeName);
                },
                child: Visibility(
                  visible: isVisible,
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'تخط',
                      style: AppStyles.regular13
                          .copyWith(color: Color(0xff949d9e)),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 64,
        ),
        Center(child: title),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppStyles.semiBold13.copyWith(
              color: Color(0xff4e5456),
            ),
          ),
        ),
      ],
    );
  }
}
