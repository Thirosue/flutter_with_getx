import 'package:flutter/material.dart';

enum CardNetworkTypeKey {
  visa,
  mastercard,
  visaBasic,
  rupay,
  americanExpress,
  discover,
  unionPay,
}

class CardNetworkType {
  static final Map<String, dynamic> _mappings = {
    CardNetworkTypeKey.visa.name: CardNetworkType.visa,
    CardNetworkTypeKey.mastercard.name: CardNetworkType.mastercard,
    CardNetworkTypeKey.visaBasic.name: CardNetworkType.visaBasic,
    CardNetworkTypeKey.rupay.name: CardNetworkType.rupay,
    CardNetworkTypeKey.americanExpress.name: CardNetworkType.americanExpress,
    CardNetworkTypeKey.discover.name: CardNetworkType.discover,
    CardNetworkTypeKey.unionPay.name: CardNetworkType.unionPay,
  };

  static CardNetworkType visa = CardNetworkType(
    Image.asset(
      'images/visa.jpeg',
      height: 35,
    ),
  );

  static CardNetworkType mastercard = CardNetworkType(
    Image.asset(
      'images/mastercard.png',
      height: 40,
    ),
  );

  static CardNetworkType visaBasic = CardNetworkType(
    Image.asset(
      'images/visa_basic.png',
      height: 20,
    ),
  );

  static CardNetworkType rupay = CardNetworkType(
    Image.asset(
      'images/rupay_logo.png',
      height: 40,
    ),
  );

  static CardNetworkType americanExpress = CardNetworkType(Image.asset(
    'images/amex_logo.png',
    height: 50,
  ));

  static CardNetworkType discover = CardNetworkType(Image.asset(
    'images/discover.png',
    height: 50,
  ));

  static CardNetworkType unionPay = CardNetworkType(Image.asset(
    'images/union_pay.png',
    height: 50,
  ));

  static CardNetworkType of(String key) {
    assert(CardNetworkTypeKey.values.map((key) => key.name).contains(key));
    return _mappings[key];
  }

  final Widget widget;

  const CardNetworkType(this.widget);
}
