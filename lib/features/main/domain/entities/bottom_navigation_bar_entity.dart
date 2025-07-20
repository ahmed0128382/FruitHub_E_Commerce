import 'package:flutter/material.dart';

class BottomNavigationBarEntity {
  final IconData activeIcon, inActiveIcon;
  final String label;

  const BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.label,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      const BottomNavigationBarEntity(
        activeIcon: Icons.home,
        inActiveIcon: Icons.home_outlined,
        label: 'الرئيسية',
      ),
      const BottomNavigationBarEntity(
        activeIcon: Icons.grid_view_rounded,
        inActiveIcon: Icons.grid_view_outlined,
        label: 'المنتجات',
      ),
      const BottomNavigationBarEntity(
        activeIcon: Icons.shopping_cart,
        inActiveIcon: Icons.shopping_cart_outlined,
        label: 'سلة التسوق',
      ),
      const BottomNavigationBarEntity(
        activeIcon: Icons.person,
        inActiveIcon: Icons.person_outline,
        label: 'حسابي',
      ),
    ];
