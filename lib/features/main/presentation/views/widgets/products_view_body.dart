import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';

import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kTopPadding),
                SearchTextField(),
                SizedBox(height: 12),
                ProductsViewHeader(
                    productsCount: context.read<ProductsCubit>().productsCount),
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
