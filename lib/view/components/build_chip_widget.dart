import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class BuildChipWidget extends StatelessWidget {
  final String title;
  final VoidCallback onDeleted;

  BuildChipWidget({required this.title, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: CustomTextWidget(
          title: title,
          fontSize: 16,
        ),
        backgroundColor: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.grey[50],
        padding: EdgeInsets.only(bottom: 2.0, right: 2.0),
        deleteIcon: Icon(
          Icons.close,
          color: Colors.red.shade300,
        ),
        onDeleted: onDeleted);
  }
}
