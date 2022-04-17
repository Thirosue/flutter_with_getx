import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/component/molecules/dialog_actions.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/card/validity.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/helpers/error_handler.dart';
import 'package:flutter_with_getx/ui/card/detail/card_detail_controller.dart';
import 'package:get/get.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic card = Get.arguments;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final controller = Get.put(
      CardDetailController(
        repository: CardRepository(),
        initData: card,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Detail'),
      ),
      body: controller.obx(
        (state) => Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                CreditCard(
                  cardBackground: ImageCardBackground(
                      const AssetImage('images/background_sample.png')),
                  cardNetworkType: CardNetworkType.mastercard,
                  cardHolderName: 'Gursheesh Singh',
                  cardNumber: '2434 2434 **** ****',
                  company: CardCompany.kotak,
                  validity: Validity(
                    validThruMonth: 1,
                    validThruYear: 2023,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Table(
                    children: const <TableRow>[
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        children: <Widget>[
                          Text('name'),
                          Text('Gursheesh Singh'),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Text('number'),
                          Text('2434 2434 **** ****'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            verticalDirection: VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: '確認',
                    middleText: 'カードを削除します',
                    radius: 10.0,
                    actions: DialogActions.create(
                      context: context,
                      onConfirm: () async {
                        await controller.delete();

                        Get.toNamed(Path.card);
                        Get.snackbar(
                          'カード削除',
                          'カードを削除しました',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  );
                },
                tooltip: 'カード削除',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
        onError: ErrorHandler.onError,
      ),
    );
  }
}
