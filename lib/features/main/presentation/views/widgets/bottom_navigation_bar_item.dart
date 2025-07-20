import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/active_icon_button.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/inactive_icon_button.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem(
      {super.key, required this.isActive, required this.item, this.onPressed});
  final bool isActive;
  final BottomNavigationBarEntity item;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIconButton(icon: item.activeIcon, label: item.label)
        : InActiveIconButton(icon: item.inActiveIcon, onPressed: onPressed);
  }
}
