// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:credwise/models/reward_model.dart';

class CardModel {
  int? id;
  String? name;
  String? bank;
  String? cardNum;
  String? type;
  String? cardType;
  List<RewardModel> rewards;
  CardModel({
    this.id,
    required this.name,
    required this.bank,
    required this.cardNum,
    required this.type,
    required this.cardType,
    required this.rewards,
  });

  // factory CardModel.fromJson(Map<String, dynamic> json) {
  //   return CardModel(
  //     id: json['id'],
  //     name: json['name'],
  //     bank: json['bank'],
  //     cardNum: json['cardNum'],
  //     type: json['type'],
  //     cardType: json['cardType'],
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'bank': bank,
  //     'cardNum': cardNum,
  //     'type': type,
  //     'cardType': cardType,
  //   };
  // }
}
