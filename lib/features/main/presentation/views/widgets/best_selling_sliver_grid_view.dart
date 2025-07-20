import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/grid_product_item.dart';

class BestSellingSliverGridView extends StatelessWidget {
  const BestSellingSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 222,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          return const GridProductItem();
        });
  }
}
