// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:metro_mart/features/auth/models/user.dart';
import 'package:metro_mart/features/store/models/inventory.dart';

class Store {
  final String id;
  User owner;
  String name;
  String location;
  Inventory inventory;
  int branchCode;

  Store({
    required this.id,
    required this.name,
    required this.owner,
    required this.location,
    required this.branchCode,
    required this.inventory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'owner': owner.toMap(),
      'name': name,
      'location': location,
      'inventory': inventory.toMap(),
      'branchCode': branchCode,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: (map["_id"] ?? '') as String,
      owner: User.fromMap((map["owner"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
      name: (map["name"] ?? '') as String,
      location: (map["location"] ?? '') as String,
      inventory: Inventory.fromMap((map["inventory"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
      branchCode: (map["branchCode"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);
}
