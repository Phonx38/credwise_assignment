import 'package:credwise/models/bank_model.dart';

class Repositry {
  List getAll() => _allBank;

  getCardByBank(String bank) => _allBank
      .map((map) => Bank.fromJson(map))
      .where((item) => item.bank == bank)
      .map((item) => item.cards)
      .expand((i) => i)
      .toList();

  List<String> getBanks() => _allBank
      .map((map) => Bank.fromJson(map))
      .map((item) => item.bank)
      .toList();

  List _allBank = [
    {
      "bank": "State Bank of India",
      "alias": "SBI",
      "cards": [
        "Visa Card",
        "Master Card",
        "Premium Card",
      ]
    },
    {
      "bank": "HDFC Bank",
      "alias": "hdfc",
      "cards": [
        "Regalia Platinum",
        "Expensive Card",
        "Premium Card",
      ]
    },
  ];
}
