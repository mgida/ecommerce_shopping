import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSwipeContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  CustomSwipeContainer(
      {required this.title,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: IconSlideAction(
          caption: title,
          color: color,
          icon: icon,
          onTap: onTap,
        ),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    );
  }
}
