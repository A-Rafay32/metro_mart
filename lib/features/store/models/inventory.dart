// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:metro_mart/features/store/models/products.dart';

class Inventory {
  final String id;
  String ownerId;
  String storeId;
  List<Product> products;

  int get totalItems => products.length;
  Inventory({
    required this.id,
    required this.storeId,
    required this.products,
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ownerId': ownerId,
      'storeId': storeId,
      'products': products.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      id: (map["id"] ?? '') as String,
      ownerId: (map["ownerId"] ?? '') as String,
      storeId: (map["storeId"] ?? '') as String,
      products: List<Product>.from(
        ((map['products'] ?? const <Product>[]) as List).map<Product>((x) {
          return Product.fromMap(
              (x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Inventory.fromJson(String source) =>
      Inventory.fromMap(json.decode(source) as Map<String, dynamic>);
}
