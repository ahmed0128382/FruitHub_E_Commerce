import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/bottom_navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int selectedIndex = 0; // Index of the selected item
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(bottomNavigationBarItems.length, (index) {
          return CustomBottomNavigationBarItem(
            isActive:
                index == selectedIndex, // Example: Set the first item as active
            item: bottomNavigationBarItems[index],
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }),
      ),
    );
  }
}
