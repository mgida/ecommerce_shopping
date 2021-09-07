import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomFilterRowWidget extends StatelessWidget {
  final String title;
  final IconData icons;
  final VoidCallback onTap;

  CustomFilterRowWidget(
      {required this.title, required this.icons, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: title,
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Colors.black.withOpacity(0.8),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            icons,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

/*
 PopupMenuButton<Categories>(
          child: Icon(
            icons,
            color: Colors.black.withOpacity(0.8),
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<Categories>>[
              const PopupMenuItem<Categories>(
                value: Categories.shirts,
                child: Text('shirts'),
              ),
              const PopupMenuItem<Categories>(
                value: Categories.shorts,
                child: Text('shorts'),
              ),
              const PopupMenuItem<Categories>(
                value: Categories.hoodie,
                child: Text('hoodie'),
              ),
            ];
          },
          onSelected: onSelected,
          onCanceled: () {
            print('canceled');
          },
          elevation: 4.0,
        ),
 */
/*
  PopupMenuButton<String>(
          child: Icon(
            icons,
            color: Colors.black.withOpacity(0.8),
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'shirts',
                child: Text('shirts'),
              ),
              const PopupMenuItem<String>(
                value: 'shorts',
                child: Text('shorts'),
              ),
              const PopupMenuItem<String>(
                value: 'hoodie',
                child: Text('hoodie'),
              ),
            ];
          },
          onSelected: onSelected,
          onCanceled: () {
            print('canceled');
          },
          elevation: 4.0,
        ),
 */
