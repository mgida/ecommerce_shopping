import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomListTilePersonWidget extends StatelessWidget {
  final IconData personIcon;
  final double personIconSize;
  final String personTitle;
  final int itemsCount;

  CustomListTilePersonWidget(
      {required this.personIcon,
      this.personIconSize = 25,
      required this.personTitle,
      required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Icon(
            personIcon,
            size: 30,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: personTitle,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                width: 6,
              ),
              CustomTextWidget(
                fontSize: 12.0,
                title: '($itemsCount items)',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.black,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
