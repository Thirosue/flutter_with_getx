import 'package:flutter/material.dart';
import 'package:flutter_with_getx/component/templates/template.dart';
import 'package:flutter_with_getx/data/const/page_index.dart';
import 'package:flutter_with_getx/ui/index/index_controller.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final controller = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Template(
      index: PageIndex.index,
      child: Center(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index]),
              );
            },
          ),
          onLoading: const SizedBox.shrink(),
          onEmpty: const Text('no data'),
          onError: ((error) => Text(
                error!,
                style: const TextStyle(color: Colors.red),
              )),
        ),
      ),
    );
  }
}
