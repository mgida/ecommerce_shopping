import 'package:flutter/material.dart';

class CustomQuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CustomQuantityButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16,
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }
}
