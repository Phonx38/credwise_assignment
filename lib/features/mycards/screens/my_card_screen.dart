import 'package:credwise/colors.dart';
import 'package:credwise/features/mycards/widgets/card_slider.dart';
import 'package:credwise/features/mycards/widgets/credit_card_field.dart';
import 'package:credwise/features/rewards/reward_list.dart';
import 'package:credwise/models/card_model.dart';
import 'package:credwise/models/reward_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

class MyCardsScreen extends ConsumerStatefulWidget {
  static const String routeName = "/cards-screen";
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends ConsumerState<MyCardsScreen> {
  List<String> banks = ['State Bank of India', 'HDFC Bank'];
  List<String> sbiCards = ['Visa Debit Card', "Credit Card"];
  List<String> hdfcCards = ['Regalia Premium', 'Regalia Platinum'];

  List<CardModel> creditCards = [
    CardModel(
        name: "John Wayne",
        bank: "HDFC Bank",
        cardNum: "1234567891232345",
        type: "Regalia Platinum",
        rewards: <RewardModel>[
          RewardModel(
              title: 'Travel & Rewards',
              type: 'Free Pass',
              desc: 'Lounge Access',
              date: 'Oct 21-30/2022',
              image: 'scene.jpg'),
          RewardModel(
              title: 'Electronics',
              type: '20% Discount',
              desc: 'Lounge Access',
              date: 'Oct 21-30/2022',
              image: 'electronics.jpg'),
          RewardModel(
              title: 'Food & Drinks',
              type: 'Free Drinks',
              desc: 'Reserved Seat',
              date: 'Oct 21-30/2022',
              image: 'pub.jpg'),
        ],
        cardType: "master.png"),
    CardModel(
        name: "John Wayne",
        bank: "State Bank of India",
        cardNum: "1234567891232345",
        type: "Regalia Platinum",
        cardType: "master.png",
        rewards: <RewardModel>[
          RewardModel(
              title: 'Fine Dining',
              type: '20% Discount',
              desc: 'Lounge Access',
              date: 'Oct 21-30/2022',
              image: 'scene.jpg'),
          RewardModel(
              title: 'Electronics',
              type: 'Free Drinks',
              desc: 'Reserved Seat',
              date: 'Oct 21-30/2022',
              image: 'electronics.jpg'),
        ]),
    CardModel(
      name: "John Wayne",
      bank: "State Bank of India",
      cardNum: "1234567891232345",
      type: "Regalia Platinum",
      cardType: "master.png",
      rewards: <RewardModel>[
        RewardModel(
            title: 'Travel & Rewards',
            type: 'Free Pass',
            desc: 'Lounge Access',
            date: 'Oct 21-30/2022',
            image: 'scene.jpg'),
        RewardModel(
            title: 'Electronics',
            type: '20% Discount',
            desc: 'Lounge Access',
            date: 'Oct 21-30/2022',
            image: 'scene.jpg'),
        RewardModel(
            title: 'Restaurant',
            type: 'Free Drinks',
            desc: 'Reserved Seat',
            date: 'Oct 21-30/2022',
            image: 'scene.jpg'),
      ],
    ),
    CardModel(
      name: "John Wayne",
      bank: "HDFC Bank",
      cardNum: "1234567891232345",
      type: "Regalia Platinum",
      cardType: "master.png",
      rewards: <RewardModel>[
        RewardModel(
            title: 'Travel & Rewards',
            type: 'Free Pass',
            desc: 'Lounge Access',
            date: 'Oct 21-30/2022',
            image: 'scene.jpg'),
        RewardModel(
            title: 'Electronics',
            type: '20% Discount',
            desc: 'Lounge Access',
            date: 'Oct 21-30/2022',
            image: 'scene.jpg'),
      ],
    ),
  ];

  final _nameController = TextEditingController();
  final pin1 = TextEditingController();
  final pin2 = TextEditingController();
  final pin3 = TextEditingController();
  final pin4 = TextEditingController();
  bool pv1 = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> _cards = [];
  var selectedBank;
  var selectedCard;
  @override
  void initState() {
    super.initState();
    CardSlider(
      cardsList: creditCards,
    );
  }

  addCard(CardModel card) {
    setState(() {
      creditCards.add(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final caroselVal = ref.watch(carouselProvider);
    return Scaffold(
        key: scaffoldKey,
        floatingActionButton: SizedBox(
          height: 40,
          child: FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
            backgroundColor: blueColor,
            onPressed: () {
              displayBottomSheet(context, size).whenComplete(() {
                _formKey.currentState?.reset();
                selectedBank = null;
                selectedCard = null;
                pv1 = false;
                _nameController.clear();
                pin1.clear();
                pin2.clear();
                pin3.clear();
                pin4.clear();
              });
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: const Text(
              'Add Card',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.square(1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black87,
            ),
          ),
          title: Text('My Cards',
              style: GoogleFonts.lato(
                  color: Colors.black87, fontWeight: FontWeight.w600)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Manage your Cards',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CardSlider(
                  cardsList: creditCards,
                ),
                Consumer(builder: (context, ref, child) {
                  int temp = ref.watch(carouselProvider);
                  int rewardIndex = (creditCards.length - 1) - temp;
                  return RewardList(rewardsList: creditCards[rewardIndex]);
                }),
              ],
            ),
          ),
        ));
  }

// dropdownfield
  Widget dropdownField({
    String? Function(Object?)? validator,
    required String hintName,
    required void Function(Object?)? onChanged,
    required List<DropdownMenuItem<Object>>? items,
    Object? value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintName,
            style: const TextStyle(color: Colors.black87, fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    isDense: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: validator,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    iconDisabledColor: blueColor,
                    iconEnabledColor: blueColor,
                    hint: Text(hintName, style: const TextStyle(fontSize: 13)),
                    value: value,
                    onChanged: onChanged,
                    items: items,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //card added snack bar
  showSuccessSnackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
        content: Text(
          'Card Added',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  //show bottom sheet
  displayBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              // height: size.height * 0.6,
              width: size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //name field

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter Name',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 13),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 10),
                            child: Stack(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Name',
                                    hintStyle: const TextStyle(fontSize: 13),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(8),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val?.isEmpty == true) {
                                      return 'Please enter name';
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Bank Dropdown
                    dropdownField(
                      hintName: 'Bank Name',
                      validator: (value) =>
                          value == null ? 'Please select Bank Name' : null,
                      onChanged: (bank) {
                        if (bank == 'State Bank of India') {
                          _cards = sbiCards;
                        } else if (bank == 'HDFC Bank') {
                          _cards = hdfcCards;
                        } else {
                          _cards = [];
                        }
                        setState(() {
                          selectedCard = null;
                          selectedBank = bank;
                        });
                      },
                      items: banks.map((bank) {
                        return DropdownMenuItem(
                          value: bank,
                          child: Text(bank),
                        );
                      }).toList(),
                      value: selectedBank,
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    //Card Dependent dropdown
                    dropdownField(
                      hintName: 'Card Name',
                      validator: (value) =>
                          value == null ? 'Please select Bank Name' : null,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCard = newValue.toString();
                        });
                      },
                      items: _cards.map((card) {
                        return DropdownMenuItem(
                          child: Text(card),
                          value: card,
                        );
                      }).toList(),
                      value: selectedCard,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //Credit card field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Card number",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                creditCardField(
                                  size: size,
                                  onChanged: (val) {
                                    if (val.length == 4) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: pin1,
                                ),
                                creditCardField(
                                  size: size,
                                  onChanged: (val) {
                                    if (val.length == 4) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: pin2,
                                ),
                                creditCardField(
                                  size: size,
                                  onChanged: (val) {
                                    if (val.length == 4) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: pin3,
                                ),
                                creditCardField(
                                  size: size,
                                  onChanged: (val) {
                                    if (val.length == 4) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  controller: pin4,
                                ),
                              ],
                            ),
                          ),
                          pv1
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2),
                                  child: Text(
                                    'Invalid Card Number',
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 12),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //Add Card Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: blueColor,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            var cn =
                                pin1.text + pin2.text + pin3.text + pin4.text;
                            if (_formKey.currentState!.validate() &&
                                cn.length == 16) {
                              addCard(
                                CardModel(
                                    name: _nameController.text,
                                    bank: selectedBank,
                                    cardNum: cn,
                                    type: selectedCard,
                                    rewards: [],
                                    cardType: 'master.png'),
                              );
                              ref.read(carouselProvider.state).state = 0;
                              Navigator.of(context).pop();

                              setState(() => {pv1 = false});
                              showSuccessSnackBar();
                            }
                            setState(() => {pv1 = true});
                          },
                          child: const Text(
                            'Add Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
