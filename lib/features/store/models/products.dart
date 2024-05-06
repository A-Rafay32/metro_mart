// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String id;
  String name;
  double price;
  int inventoryQty;
  ProductQrCode qrcode;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.inventoryQty,
    required this.qrcode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'inventoryQty': inventoryQty,
      'qrcode': qrcode.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: (map["id"] ?? ''),
        name: (map["name"] ?? ''),
        price: (map["price"] ?? 0.0),
        inventoryQty: (map["inventoryQty"] ?? 0),
        qrcode: map["qrcode"]);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductQrCode {
  int? scannedQty;
  String qrCode;

  ProductQrCode({
    required this.qrCode,
    this.scannedQty = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scannedQty': scannedQty,
      'qrCOde': qrCode,
    };
  }

  factory ProductQrCode.fromMap(Map<String, dynamic> map) {
    return ProductQrCode(
      scannedQty: map['scannedQty'] != null ? map["scannedQty"] ?? 0 : null,
      qrCode: (map["qrCOde"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductQrCode.fromJson(String source) =>
      ProductQrCode.fromMap(json.decode(source) as Map<String, dynamic>);
}
