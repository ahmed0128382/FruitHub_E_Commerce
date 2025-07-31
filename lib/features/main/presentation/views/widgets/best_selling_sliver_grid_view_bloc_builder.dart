import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/best_selling_products_cubit/best_selling_products_cubit.dart';
import 'package:fruit_hub/core/helper/get_dumm_product.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/core/widgets/custom_sliver_loading.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view.dart';

class BestSellingSliverGridViewBlocBuilder extends StatelessWidget {
  const BestSellingSliverGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellingProductsCubit, BestSellingProductsState>(
      builder: (context, state) {
        if (state is BestSellingProductsLoading) {
          return CustomSliverLoading(
            isLoading: true,
            child: ProductsSliverGridView(
              products:
                  getDummyProducts(count: 10), // Skeleton or dummy content
            ),
          );
        } else if (state is BestSellingProductsSuccess) {
          return CustomSliverLoading(
            isLoading: false,
            child: ProductsSliverGridView(
              products: state.bestSellingProducts,
            ),
          );
        } else if (state is BestSellingProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errMessage: state.errMessage,
            ),
          );
        } else {
          // Initial or unknown state
          return SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }
      },
    );
  }
}
