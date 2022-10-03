// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:credwise/models/card_model.dart';

class CardWiget extends StatelessWidget {
  final CardModel cardData;
  const CardWiget({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   currentIndex = index;
          // });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12)),
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardData.name!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        cardData.bank == "HDFC Bank"
                            ? Image.asset(
                                "hdfc.png",
                                width: 70,
                              )
                            : Image.asset(
                                "sbi.png",
                                width: 40,
                              )
                      ],
                    ),
                    const Icon(Icons.edit, color: Colors.blueAccent, size: 15)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "**** **** **** ${cardData.cardNum!.substring(cardData.cardNum!.length - 4)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                Text(
                  cardData.type!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  cardData.cardType!,
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
