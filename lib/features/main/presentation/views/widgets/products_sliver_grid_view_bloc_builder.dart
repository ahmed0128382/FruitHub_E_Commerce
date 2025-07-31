import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helper/get_dumm_product.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/core/widgets/custom_sliver_loading.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view.dart';

class ProductsSliverGridViewBlocBuilder extends StatelessWidget {
  const ProductsSliverGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final isLoading = state is ProductsLoading;

        if (state is ProductsSuccess) {
          return CustomSliverLoading(
            isLoading: false,
            child: ProductsSliverGridView(products: state.products),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errMessage: 'حدث خطأ أثناء تحميل المنتجات',
            ),
          );
        } else {
          return CustomSliverLoading(
            isLoading: isLoading,
            child: ProductsSliverGridView(
              products: getDummyProducts(count: 10),
            ),
          );
        }
      },
    );
  }
}
