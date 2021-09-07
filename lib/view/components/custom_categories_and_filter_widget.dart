import 'package:flutter/material.dart';
import 'custom_filter_row_widget.dart';

class CustomCategoriesAndFilterWidget extends StatelessWidget {
  final VoidCallback onTapCategories;
  final VoidCallback onTapFilterAndSort;

  CustomCategoriesAndFilterWidget(
      {required this.onTapCategories, required this.onTapFilterAndSort});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomFilterRowWidget(
          title: 'CATEGORIES',
          icons: Icons.arrow_drop_down,
          onTap: onTapCategories,
        ),
        CustomFilterRowWidget(
          title: 'FILTER & SORT',
          icons: Icons.filter_list,
          onTap: onTapFilterAndSort,
        ),
      ],
    );
  }
}
