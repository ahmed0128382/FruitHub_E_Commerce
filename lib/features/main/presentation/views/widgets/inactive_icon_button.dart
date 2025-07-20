import 'package:flutter/material.dart';

class InActiveIconButton extends StatelessWidget {
  const InActiveIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
