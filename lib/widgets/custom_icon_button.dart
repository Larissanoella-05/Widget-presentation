import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: ShapeDecoration(
          color: backgroundColor ?? Colors.blue,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(icon),
          color: iconColor ?? Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }
}