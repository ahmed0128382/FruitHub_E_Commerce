import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

AppBar appBarWidget(context,
    {required String title, bool showBackArrow = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.bold19,
    ),
    leading: Visibility(
      visible: showBackArrow,
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new)),
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications,
          size: 30,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          // Handle notification button press
          buildErrorBar(context, 'لا توجد إشعارات جديدة');
        },
      ),
    ],
  );
}

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({super.key, required this.title});
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Icon(Icons.arrow_back_ios_new)),
//           Text(
//             title,
//             style: AppStyles.bold19,
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.notifications,
//               size: 30,
//               color: AppColors.primaryColor,
//             ),
//             onPressed: () {
//               // Handle notification button press
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('لا توجد إشعارات جديدة')),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
