// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:metro_mart/features/store/models/products.dart';

class UserCart {
  Product product;
  int quantity;

  UserCart({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory UserCart.fromMap(Map<String, dynamic> map) {
    return UserCart(
      product: Product.fromMap((map["product"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
      quantity: (map["quantity"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCart.fromJson(String source) =>
      UserCart.fromMap(json.decode(source) as Map<String, dynamic>);
}
