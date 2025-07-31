import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/best_selling_products_cubit/best_selling_products_cubit.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/products_sliver_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BestSellingProductsCubit>().getBestSellingProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: 12),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 12),
              ],
            ),
          ),
          BestSellingSliverGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
