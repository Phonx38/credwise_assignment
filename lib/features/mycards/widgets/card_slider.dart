// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:credwise/features/mycards/widgets/card_widget.dart';
import 'package:credwise/models/card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselProvider = StateProvider((ref) => 0);

class CardSlider extends ConsumerStatefulWidget {
  final List<CardModel> cardsList;
  const CardSlider({
    Key? key,
    required this.cardsList,
  }) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends ConsumerState<CardSlider> {
  CarouselController controller = CarouselController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int myIndex = ref.watch(carouselProvider);
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: widget.cardsList.length,
          options: CarouselOptions(
            onPageChanged: (val, _) {
              setState(() {
                currentIndex = val;
              });
              ref.read(carouselProvider.state).state = currentIndex;
            },
            enableInfiniteScroll: false,
            viewportFraction: 0.75,
            height: 200,
            padEnds: false,
          ),
          itemBuilder: (context, index, realIndex) {
            var nindex = (widget.cardsList.length - 1) - index;
            return CardWiget(
              cardData: widget.cardsList[nindex],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 0; i < widget.cardsList.length; i++)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color:
                            i == currentIndex ? Colors.black : Colors.black26,
                        borderRadius: BorderRadius.circular(5))),
              )
          ]),
        )
      ],
    );
  }
}
