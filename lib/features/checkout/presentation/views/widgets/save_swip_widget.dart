import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/swip_action_button.dart';

class SaveSwipWidget extends StatefulWidget {
  const SaveSwipWidget({super.key});

  @override
  State<SaveSwipWidget> createState() => _SaveSwipWidgetState();
}

class _SaveSwipWidgetState extends State<SaveSwipWidget> {
  bool isSwipped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SwipActionButton(
          isSwipped: isSwipped,
          onSwipChanged: (value) {
            setState(() {
              isSwipped = value;
            });
          },
        ),
        SizedBox(
          width: 4,
        ),
        Text('حفظ العنوان',
            style:
                AppStyles.regular16.copyWith(color: AppColors.semilightWhite)),
      ],
    );
  }
}
