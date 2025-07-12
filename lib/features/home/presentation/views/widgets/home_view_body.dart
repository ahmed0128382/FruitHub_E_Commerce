import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kTopPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: CustomHomeAppBar(),
              ),
              //SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SearchTextField(),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: FeaturedItem(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
