import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 214,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: const Color(0xfff3f5f7),
      ),
      child: Column(
        children: [
          // Top spacing + image + icon
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: [
                Image.network(
                  product.imageUrl!,
                  width: 163,
                  height: 130,
                  fit: BoxFit.cover,
                  // أثناء التحميل الجزئي للصورة
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 163,
                      height: 130,
                      color: Colors.grey.shade200,
                      child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                  // عند فشل التحميل
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 163,
                      height: 130,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(Icons.broken_image,
                            color: Colors.grey, size: 40),
                      ),
                    );
                  },
                ),
                // SvgPicture.asset(
                //   AppImages.imagesPineapple,
                //   width: 163,
                //   height: 130,
                //   fit: BoxFit.cover,
                // ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.favorite_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Product details and add button
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppStyles.semiBold16.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '${product.price}جنيه',
                          style: AppStyles.bold13.copyWith(
                            color: Color(0xfff4a91f),
                          ),
                        ),
                        Text(
                          '/ كيلو',
                          style: AppStyles.semiBold13.copyWith(
                            color: Color(0xfff8c7cd),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addProduct(product);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   width: 163,
    //   height: 214,
    //   decoration: ShapeDecoration(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    //     color: const Color(0xfff3f5f7),
    //   ),
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         top: 0,
    //         right: 0,
    //         child: IconButton(
    //           onPressed: () {},
    //           icon: Icon(Icons.favorite_outline),
    //         ),
    //       ),
    //       Positioned(
    //         top: 20,
    //         left: 20,
    //         child: Column(
    //           children: [
    //             SvgPicture.asset(AppImages.imagesPineapple),
    //             Row(
    //               children: [
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'أناناس',
    //                       style: AppStyles.semiBold16.copyWith(
    //                         color: Colors.black,
    //                       ),
    //                     ),
    //                     SizedBox(height: 8),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           '20جنيه',
    //                           style: AppStyles.bold13.copyWith(
    //                             color: Color(0xfff4a91f),
    //                           ),
    //                         ),
    //                         Text(
    //                           '/ كيلو',
    //                           style: AppStyles.semiBold13.copyWith(
    //                             color: Color(0xfff8c7cd),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Spacer(),
    //                 CircleAvatar(
    //                   backgroundColor: AppColors.primaryColor,
    //                   child: Icon(
    //                     Icons.add,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
