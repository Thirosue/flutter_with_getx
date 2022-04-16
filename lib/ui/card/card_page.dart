import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_slider.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/card/validity.dart';

Color kPink = const Color(0xFFEE4CBF);
Color kRed = const Color(0xFFFA3754);
Color kBlue = const Color(0xFF4AA3F2);
Color kPurple = const Color(0xFFAF92FB);

final creditCards = [
  CreditCard(
    cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
    cardNetworkType: CardNetworkType.visaBasic,
    cardHolderName: 'The boring developer',
    cardNumber: '1234 1234 1234 1234',
    company: CardCompany.yesBank,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 21,
      validFromMonth: 1,
      validFromYear: 16,
    ),
  ),
  CreditCard(
    cardBackground: SolidColorCardBackground(kRed.withOpacity(0.4)),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'Gursheesh Singh',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.kotak,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 21,
    ),
  ),
  CreditCard(
    cardBackground: GradientCardBackground(LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [kBlue, kPurple],
      stops: const [0.3, 0.95],
    )),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'Very Very very boring devloper',
    cardNumber: '4567',
    company: CardCompany.sbiCard,
    validity: Validity(
      validThruMonth: 2,
      validThruYear: 2021,
    ),
  ),
  CreditCard(
    cardBackground:
        ImageCardBackground(const AssetImage('images/background_sample.png')),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'John Doe',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.virgin,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 20,
    ),
  ),
];

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.card,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CreditCardSlider(
            creditCards,
            repeatCards: RepeatCards.bothDirection,
            onCardClicked: (index) {
              debugPrint('Clicked at index: $index');
            },
          ),
        ),
      ),
    );
  }
}
