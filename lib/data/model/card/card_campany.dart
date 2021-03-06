import 'package:flutter/material.dart';

enum CardCompanyKey {
  americanExpress,
  virgin,
  sbi,
  sbiCard,
  kotak,
  axisBank,
  axisBankWhite,
  citiBank,
  hdfc,
  hsbc,
  icici,
  indusland,
  yesBank,
}

class CardCompany {
  static final Map<String, dynamic> _mapping = {
    CardCompanyKey.americanExpress.name: CardCompany.americanExpress,
    CardCompanyKey.virgin.name: CardCompany.virgin,
    CardCompanyKey.sbi.name: CardCompany.sbi,
    CardCompanyKey.sbiCard.name: CardCompany.sbiCard,
    CardCompanyKey.kotak.name: CardCompany.kotak,
    CardCompanyKey.axisBank.name: CardCompany.axisBank,
    CardCompanyKey.axisBankWhite.name: CardCompany.axisBankWhite,
    CardCompanyKey.citiBank.name: CardCompany.citiBank,
    CardCompanyKey.hdfc.name: CardCompany.hdfc,
    CardCompanyKey.hsbc.name: CardCompany.hsbc,
    CardCompanyKey.icici.name: CardCompany.icici,
    CardCompanyKey.indusland.name: CardCompany.indusland,
    CardCompanyKey.yesBank.name: CardCompany.yesBank,
  };

  static CardCompany americanExpress = const CardCompany(
    Text(
      'AMERICAN \nEXPRESS',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );

  static CardCompany virgin = CardCompany(
    Image.asset(
      'images/virgin.png',
      height: 40,
    ),
  );

  static CardCompany sbi = CardCompany(
    Image.asset(
      'images/sbi_card.gif',
      height: 35,
    ),
  );

  static CardCompany sbiCard = CardCompany(
    Image.asset(
      'images/sbi.png',
      height: 35,
    ),
  );

  static CardCompany kotak = CardCompany(
    Image.asset(
      'images/kotak_logo.png',
      height: 35,
    ),
  );

  static CardCompany axisBank = CardCompany(
    Image.asset(
      'images/axis_bank_logo.png',
      height: 35,
    ),
  );

  static CardCompany axisBankWhite = CardCompany(
    Image.asset(
      'images/axis_bank_logo.png',
      height: 35,
      color: Colors.white,
    ),
  );

  static CardCompany citiBank = CardCompany(
    Image.asset(
      'images/citibank_logo.png',
      height: 25,
    ),
  );

  static CardCompany hdfc = CardCompany(
    Image.asset(
      'images/hdfc_logo.png',
      height: 25,
    ),
  );

  static CardCompany hsbc = CardCompany(
    Image.asset(
      'images/hsbc_logo.png',
      height: 30,
    ),
  );

  static CardCompany icici = CardCompany(
    Image.asset(
      'images/icici_bank_logo.png',
      height: 25,
    ),
  );

  static CardCompany indusland = CardCompany(
    Image.asset(
      'images/indusland.png',
      height: 15,
    ),
  );

  static CardCompany yesBank = CardCompany(
    Image.asset(
      'images/yes_bank_logo.png',
      height: 35,
    ),
  );

  static CardCompany of(String key) {
    assert(CardCompanyKey.values.map((key) => key.name).contains(key));
    return _mapping[key];
  }

  final Widget widget;

  const CardCompany(this.widget);
}
