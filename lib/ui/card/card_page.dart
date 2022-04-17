import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_slider.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/card/validity.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/error_handler.dart';
import 'package:flutter_with_getx/ui/card/card_controller.dart';
import 'package:flutter_with_getx/ui/card/detail/card_detail_page.dart';
import 'package:get/get.dart';

Color kPink = const Color(0xFFEE4CBF);
Color kRed = const Color(0xFFFA3754);
Color kBlue = const Color(0xFF4AA3F2);
Color kPurple = const Color(0xFFAF92FB);

final cardBackgrounds = [
  SolidColorCardBackground(Colors.black.withOpacity(0.6)),
  SolidColorCardBackground(kPink.withOpacity(0.2)),
  SolidColorCardBackground(kRed.withOpacity(0.4)),
  GradientCardBackground(
    LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [kBlue, kPurple],
      stops: const [0.3, 0.95],
    ),
  ),
  ImageCardBackground(const AssetImage('images/background_sample.png')),
  ImageCardBackground(const AssetImage('images/background_sample_1.png')),
  ImageCardBackground(const AssetImage('images/background_sample_2.png')),
  ImageCardBackground(const AssetImage('images/background_sample_3.png')),
  ImageCardBackground(const AssetImage('images/background_sample_4.png')),
];

class CardPage extends StatelessWidget {
  CardPage({Key? key}) : super(key: key);

  final controller = Get.put(CardController(CardRepository()));

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.card,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.obx(
          (state) {
            final _creditCards = state
                ?.map(
                  (value) => CreditCard(
                    cardBackground: cardBackgrounds[
                        Random().nextInt(cardBackgrounds.length)],
                    cardNetworkType: CardNetworkType.of(value.type!),
                    cardHolderName: value.name,
                    cardNumber: value.cardNumber,
                    company: CardCompany.of(value.campany!),
                    validity: Validity(
                      validThruMonth: value.validity?.validThruMonth as int,
                      validThruYear: value.validity?.validThruYear as int,
                    ),
                  ),
                )
                .toList() as List<CreditCard>;

            return Center(
              child: CreditCardSlider(
                _creditCards,
                repeatCards: RepeatCards.bothDirection,
                onCardClicked: (index) {
                  debugPrint('Clicked at index: $index');
                  Get.to(
                    () => const CardDetailPage(),
                    arguments: state![index],
                    fullscreenDialog: true,
                  );
                },
              ),
            );
          },
          onError: ErrorHandler.onError,
        ),
      ),
    );
  }
}
