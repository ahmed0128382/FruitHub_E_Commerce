import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          PageViewItem(
            image: Assets.imagesFruitBasket,
            backgroundImage: Assets.imagesPaigeBackground,
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبا بك في ',
                  style: TextStyle(
                      color: Color(0xff0c0d0d),
                      fontSize: 23,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700),
                ),
                Text('HUB',
                    style: TextStyle(
                        color: Color(0xff0c0d0d),
                        fontSize: 23,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700)),
                Text(
                  'Fruit',
                  style: TextStyle(
                      color: Color(0xff0c0d0d),
                      fontSize: 23,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          PageViewItem(
            image: Assets.imagesPineapple,
            backgroundImage: Assets.imagesGreenBackground,
            subTitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع غلي التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Text(
              'ابحث و تسوق',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff0c0d0d),
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
