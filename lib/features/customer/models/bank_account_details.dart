// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BankAccount {
  String title;
  String accountNumber;
  String bankName;
  String branchName;
  String branchCode;
  int pin;

  BankAccount({
    required this.title,
    required this.accountNumber,
    required this.bankName,
    required this.branchName,
    required this.branchCode,
    required this.pin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'accountNumber': accountNumber,
      'bankName': bankName,
      'branchName': branchName,
      'branchCode': branchCode,
      'balance': pin,
    };
  }

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
      title: (map["title"] ?? ''),
      accountNumber: (map["accountNumber"] ?? ''),
      bankName: (map["bankName"] ?? ''),
      branchName: (map["branchName"] ?? ''),
      branchCode: (map["branchCode"] ?? ''),
      pin: (map["balance"] ?? 0.0),
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccount.fromJson(String source) =>
      BankAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
