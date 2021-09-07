import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class BuildCategoriesListViewItems extends StatelessWidget {
  final VoidCallback onTapListTileItem;
  final Color containerColor;
  final Widget leadingIcon;
  final String title;

  BuildCategoriesListViewItems(
      {required this.onTapListTileItem,
      required this.containerColor,
      required this.leadingIcon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapListTileItem,
      child: Container(
        color: containerColor,
        width: double.infinity,
        child: ListTile(
          leading: leadingIcon,
          title: CustomTextWidget(
            title: title,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
