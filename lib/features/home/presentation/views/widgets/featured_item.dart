import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: itemWidth * 0.35,
                child: SvgPicture.asset(
                  AppImages.imagesPineapple,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(AppImages.imagesGreenEllipse),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22),
                    Text(
                      'عروض العيد',
                      style: AppStyles.regular13.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      'خصم 25%',
                      style: AppStyles.bold19.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 11),
                    FeaturedItemButton(
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
