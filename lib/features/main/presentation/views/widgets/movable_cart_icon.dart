import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class MovableCartIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Offset position;
  final ValueChanged<Offset> onDrag;

  const MovableCartIcon({
    super.key,
    required this.onTap,
    required this.position,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      bottom: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) =>
            onDrag(Offset(details.delta.dx, -details.delta.dy)),
        onTap: onTap,
        child: Material(
          elevation: 6,
          shape: CircleBorder(),
          color: AppColors.primaryColor,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(Icons.shopping_cart, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }
}
