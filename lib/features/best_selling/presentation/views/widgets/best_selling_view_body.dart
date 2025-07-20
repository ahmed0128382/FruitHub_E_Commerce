import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_selling_sliver_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('الأكثر مبيعًا', style: AppStyles.semiBold19),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          BestSellingSliverGridView(),
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
