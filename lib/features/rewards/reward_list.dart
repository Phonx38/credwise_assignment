// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:credwise/models/card_model.dart';
import 'package:flutter/material.dart';

import 'package:credwise/features/rewards/reward_card.dart';
import 'package:credwise/models/reward_model.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class RewardList extends StatelessWidget {
  final CardModel rewardsList;
  const RewardList({
    Key? key,
    required this.rewardsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rewardsList.rewards.isNotEmpty
        ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rewardsList.rewards.length,
            itemBuilder: (BuildContext context, int index) {
              final item = rewardsList.rewards;
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RewardCard(
                  title: item[index].title!,
                  type: item[index].type!,
                  image: item[index].image!,
                  desc: item[index].desc!,
                  date: item[index].date!,
                ),
              );
            })
        : Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    FontAwesome5.robot,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('No rewards found'),
                ],
              ),
            ),
          );
  }
}
