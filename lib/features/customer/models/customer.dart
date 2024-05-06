import 'dart:convert';
import 'package:metro_mart/features/customer/models/bank_account_details.dart';
import 'package:metro_mart/features/customer/models/user_cart.dart';

class Customer {
  final dynamic token;
  final dynamic id;
  final String name;
  final String email;
  final String password;
  final String phoneNum;
  final String cnic;
  final String userType;
  final BankAccount bankAccount;
  final List<UserCart> userCart;

  Customer({
    this.token = '',
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.userType,
    required this.bankAccount,
    required this.phoneNum,
    required this.userCart,
    required this.cnic,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNum': phoneNum,
      'cnic': cnic,
      'userType': userType,
      'bankAccount': bankAccount.toMap(),
      'userCart': userCart.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      token: map["token"] ?? null as dynamic,
      id: map["id"] ?? null as dynamic,
      name: (map["name"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
      phoneNum: (map["phoneNum"] ?? '') as String,
      cnic: (map["cnic"] ?? '') as String,
      userType: (map["userType"] ?? '') as String,
      bankAccount: BankAccount.fromMap((map["bankAccount"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
      userCart: List<UserCart>.from(
        ((map['userCart'] ?? const <UserCart>[]) as List).map<UserCart>((x) {
          return UserCart.fromMap(
              (x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
