import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';
import 'custom_text_widget.dart';

class BuildSizeContainer extends StatelessWidget {
  final ProductModel productModel;

  BuildSizeContainer({required this.productModel});

  @override
  Widget build(BuildContext context) {
    List<String> _sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
      color: Colors.grey.shade100,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _sizeList.length,
        itemBuilder: (context, index) {
          return CustomTextWidget(
            title: _sizeList[index],
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: productModel.size == _sizeList[index]
                ? Colors.blue.shade600
                : Colors.black.withOpacity(0.5),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 30.0,
          );
        },
      ),
    );
  }
}
