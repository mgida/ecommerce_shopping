import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class BuildDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  BuildDrawerListTile(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue.shade300,
        size: 30.0,
      ),
      title: CustomTextWidget(
        title: title,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(0.8),
      ),
      onTap: onTap,
    );
  }
}
