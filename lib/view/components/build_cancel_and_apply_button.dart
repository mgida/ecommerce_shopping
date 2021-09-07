import 'package:flutter/material.dart';
import 'custom_button_widget.dart';

class BuildCancelAndApplyButton extends StatelessWidget {
  final VoidCallback onPressedCancel;
  final VoidCallback onPressedApply;

  BuildCancelAndApplyButton(
      {required this.onPressedCancel, required this.onPressedApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: CustomButtonWidget(
              minWidth: 150,
              height: 60,
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: onPressedCancel,
              buttonTitle: 'CANCEL',
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
          ),
          CustomButtonWidget(
            minWidth: 150,
            height: 60,
            buttonColor: Colors.black,
            textColor: Colors.white,
            onPressed: onPressedApply,
            buttonTitle: 'APPLY',
          ),
        ],
      ),
    );
  }
}
