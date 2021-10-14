import 'package:e_commerce_app/utils/color_extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name, image, description, size, price, productId;
  Color? color;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    required this.price,
    required this.productId,
  });

  ProductModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = '\$' + map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }
}
