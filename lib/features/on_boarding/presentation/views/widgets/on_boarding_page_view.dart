import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
            isVisible: (pageController.hasClients
                ? pageController.page!.round() == 0
                : true),
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
            isVisible: !pageController.hasClients,
            // isVisible: (pageController.hasClients
            //     ? pageController.page!.round() != 0
            //     : true),
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
