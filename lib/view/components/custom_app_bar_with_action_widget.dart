import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view/screens/search_app_bar_delegate.dart';
import '../../utils/custom_icons_icons.dart';

class CustomAppBarWithActionWidget extends StatelessWidget
    with PreferredSizeWidget {
  final String title;

  CustomAppBarWithActionWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 10.0),
      width: double.infinity,
      height: 100.0,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(
            title: title,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: Icon(CustomIcons.search),
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchAppBarDelegate(),
                  );
                },
                iconSize: 30,
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CustomIcons.arrow_left,
              color: Colors.black.withOpacity(0.5),
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
