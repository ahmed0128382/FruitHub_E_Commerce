import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/cubits/best_selling_products_cubit/best_selling_products_cubit.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view_bloc_builder.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
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
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          const SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('الأكثر مبيعًا', style: AppStyles.semiBold19),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          BestSellingSliverGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

// class BestSellingViewBody extends StatelessWidget {
//   const BestSellingViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         // SafeArea(child: AppBarWidget(title: 'الأكثر مبيعًا')),
//         SizedBox(height: 12),
//         Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: kHorizontalPadding,
//               ),
//               child: Text('الأكثر مبيعًا', style: AppStyles.semiBold19),
//             )),
//         SizedBox(height: 12),
//         BestSellingSliverGridView(),
//       ],
//     );
//   }
// }
