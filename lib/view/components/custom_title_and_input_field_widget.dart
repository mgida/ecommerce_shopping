import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomTitleAndInputFieldWidget extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String suffixText;
  final VoidCallback? onTap;

  CustomTitleAndInputFieldWidget(
      {required this.title,
      required this.onChanged,
      required this.validator,
      this.obscureText = false,
      this.suffixText = '',
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: title,
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
        const  SizedBox(
          height: 10,
        ),
        TextFormField(
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: onTap,
                child: Text(suffixText),
              ),
              hoverColor: Colors.black,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            obscureText: obscureText,
            cursorColor: Colors.black),
      ],
    );
  }
}
