import 'package:flutter/material.dart';
import 'package:shopping_app/utils/extension.dart';

class ProductModel {
  String? id;
  String? image;
  String? name;
  String? price;
  String? discount;
  String? size;
  Color? color;
  int? quantity;
  int? timestamp;

  ProductModel(
      {this.image,
      this.name,
      this.price,
      this.discount,
      this.size,
      this.color,
      this.quantity,
      this.timestamp});

  ProductModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    image = map['image'];
    name = map['name'];
    price = map['price'];
    discount = map['discount'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
    quantity = map['quantity'];
    timestamp = map['timestamp'];
  }

  toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'discount': discount,
      'size': size,
      'color': color?.value.toString(),
      'quantity': 1,
      'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
    };
  }
}
