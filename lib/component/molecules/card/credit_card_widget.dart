import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/card/validity.dart';

class CreditCard extends StatelessWidget {
  final CardBackground cardBackground;
  final CardNetworkType? cardNetworkType;
  final CardCompany? company;
  final String? cardHolderName;
  final String? cardNumber;
  final double roundedCornerRadius;
  final Validity? validity;
  final Color numberColor;
  final Color validityColor;
  final Color cardHolderNameColor;
  final bool showChip;

  // ignore: use_key_in_widget_constructors
  const CreditCard({
    required this.cardBackground,
    this.cardNetworkType,
    this.cardNumber,
    this.cardHolderName,
    this.company,
    this.validity,
    this.roundedCornerRadius = 20,
    this.numberColor = Colors.white,
    this.validityColor = Colors.white,
    this.cardHolderNameColor = Colors.white,
    this.showChip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 300,
      height: 200,
      decoration: _buildBackground(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          company != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: company?.widget,
                )
              : const SizedBox.shrink(),
          showChip ? _buildChip() : const SizedBox.shrink(),
          Column(
            children: <Widget>[
              _buildCardNumber(),
              const SizedBox(height: 4),
              _buildValidity(),
              const SizedBox(height: 4),
              _buildNameAndCardNetworkType(),
            ],
          ),
        ],
      ),
    );
  }

  _buildBackground() {
    if (cardBackground is SolidColorCardBackground) {
      SolidColorCardBackground solidColorCardBackground =
          cardBackground as SolidColorCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        color: solidColorCardBackground.backgroundColor,
      );
    } else if (cardBackground is GradientCardBackground) {
      GradientCardBackground gradientCardBackground =
          cardBackground as GradientCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        gradient: gradientCardBackground.gradient,
      );
    } else if (cardBackground is ImageCardBackground) {
      ImageCardBackground imageCardBackground =
          cardBackground as ImageCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        image: imageCardBackground.build(),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        color: Colors.black,
      );
    }
  }

  _buildChip() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'images/chip.png',
        height: 25,
      ),
    );
  }

  _buildCardNumber() {
    if (cardNumber == null || cardNumber?.trim() == "") {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        cardNumber!,
        style: TextStyle(
          fontFamily: 'creditcard',
          color: numberColor,
          fontSize: 11,
        ),
      ),
    );
  }

  _buildValidity() {
    if (validity == null) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        validity?.validFromMonth != null || validity?.validFromYear != null
            ? Column(
                children: <Widget>[
                  Text(
                    'VALID FROM',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${validity?.validFromMonth.toString().padLeft(2, '0')}/${validity?.validFromYear.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 10,
                      fontFamily: 'creditcard',
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        validity?.validFromMonth != null || validity?.validFromYear != null
            ? const SizedBox(width: 24)
            : const SizedBox.shrink(),
        Column(
          children: <Widget>[
            Text(
              'VALID THRU',
              style: TextStyle(
                color: validityColor,
                fontSize: 8,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${validity?.validThruMonth.toString().padLeft(2, '0')}/${validity?.validThruYear.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: validityColor,
                fontSize: 10,
                fontFamily: 'creditcard',
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildNameAndCardNetworkType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        cardHolderName != null
            ? Expanded(
                flex: 3,
                child: AutoSizeText(
                  cardHolderName!.toUpperCase(),
                  maxLines: 1,
                  minFontSize: 8,
                  style: TextStyle(
                    fontFamily: 'creditcard',
                    color: cardHolderNameColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCardNetworkType(),
        )
      ],
    );
  }

  _buildCardNetworkType() {
    if (cardNetworkType == null) {
      return const SizedBox.shrink();
    }
    return cardNetworkType?.widget;
  }
}
