import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/widgets/grid_product_item.dart';

class ProductsSliverGridView extends StatelessWidget {
  const ProductsSliverGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? SliverGrid.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 222,
                mainAxisSpacing: 8,
                crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              return GridProductItem(
                product: products[index],
              );
            })
        : SliverToBoxAdapter(child: Container());
  }
}
