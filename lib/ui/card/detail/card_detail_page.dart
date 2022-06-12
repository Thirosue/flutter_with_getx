import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/molecules/card/credit_card_widget.dart';
import 'package:flutter_with_getx/component/molecules/dialog_actions.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/model/card/card_background.dart';
import 'package:flutter_with_getx/data/model/card/card_campany.dart';
import 'package:flutter_with_getx/data/model/card/card_network_type.dart';
import 'package:flutter_with_getx/data/model/response/c_card.dart';
import 'package:flutter_with_getx/data/repository/card_repository.dart';
import 'package:flutter_with_getx/ui/card/detail/card_detail_controller.dart';
import 'package:get/get.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({Key? key}) : super(key: key);

  Widget _label({required String label}) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
    );
  }

  Widget _tableRow({required String label, required String value}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _label(
              label: label,
            ),
          ),
          AutoSizeText(
            value,
            style: const TextStyle(
              fontFamily: 'notosans',
              fontSize: 14,
              color: Colors.grey,
            ),
            minFontSize: 10,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = Get.arguments as CCard;

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
      body: Scaffold(
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
                cardNetworkType: CardNetworkType.of(card.type!),
                cardHolderName: card.name,
                cardNumber: card.cardNumber,
                company: CardCompany.of(card.campany!),
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Table(
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            _tableRow(
                              label: '名前',
                              value: 'Gursheesh Singh',
                            )
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            _tableRow(
                              label: 'カード番号',
                              value: '2434 2434 **** ****',
                            )
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: _label(
                                      label: '通知',
                                    ),
                                  ),
                                  Switch(
                                    value: controller.on.value,
                                    onChanged: controller.toggle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
    );
  }
}
