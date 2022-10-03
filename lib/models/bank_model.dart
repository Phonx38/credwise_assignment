// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bank {
  String bank;
  String alias;
  List<String> cards;
  Bank({
    required this.bank,
    required this.alias,
    required this.cards,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bank': bank,
      'alias': alias,
      'cards': cards,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
        bank: map['bank'] as String,
        alias: map['alias'] as String,
        cards: List<String>.from(
          (map['cards'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) =>
      Bank.fromMap(json.decode(source) as Map<String, dynamic>);
}
