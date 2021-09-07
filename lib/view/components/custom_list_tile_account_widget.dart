import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomListTileAccountWidget extends StatelessWidget {
  final IconData socialIcon;
  final String socialTitle;
  final Color containerColor;
  final Color socialIconColor;
  final Color socialTitleColor;
  final Border border;
  final VoidCallback onTap;

  CustomListTileAccountWidget(
      {required this.socialIcon,
      required this.socialTitle,
      this.containerColor = Colors.white,
      this.socialIconColor = Colors.white,
      this.socialTitleColor = Colors.white,
      this.border = const Border.symmetric(vertical: BorderSide.none),
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: border,
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              socialIcon,
              color: socialIconColor,
              size: 30,
            ),
            const SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: onTap,
              child: CustomTextWidget(
                title: socialTitle,
                color: socialTitleColor,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
