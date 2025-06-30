import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
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
            isVisible: true,
            // isVisible: (pageController.hasClients
            //     ? pageController.page!.round() == 0
            //     : true),
            image: Assets.imagesFruitBasket,
            backgroundImage: Assets.imagesPaigeBackground,
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبا بك في ',
                  style: AppStyles.bold23,
                ),
                Text(
                  'HUB',
                  style: AppStyles.bold23.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  'Fruit',
                  style: AppStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          PageViewItem(
            isVisible: false,
            // isVisible: !pageController.hasClients,
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
              style: AppStyles.bold23,
            ),
          )
        ],
      ),
    );
  }
}
