import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomItemsLengthRowWidget extends StatelessWidget {
  final int count;
  final VoidCallback? onTapGrid;
  final VoidCallback? onTapSingle;

  CustomItemsLengthRowWidget(
      {required this.count, this.onTapGrid, this.onTapSingle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: '${count == 0 ? '' : count} items',
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          child: Icon(
            Icons.view_headline,
            color: Colors.black,
          ),
          onTap: onTapSingle,
        ),
        GestureDetector(
          child: Icon(
            Icons.grid_view,
            color: Colors.black,
          ),
          onTap: onTapGrid,
        ),
      ],
    );
  }
}
