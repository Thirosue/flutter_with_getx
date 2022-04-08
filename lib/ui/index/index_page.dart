import 'package:flutter/material.dart';
import 'package:flutter_with_getx/ui/index/index_controller.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final controller = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Page'),
      ),
      body: Center(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index]),
              );
            },
          ),
          onError: ((error) => Text(
                error!,
                style: const TextStyle(color: Colors.red),
              )),
          onEmpty: const Text('no data'),
          onLoading: const CircularProgressIndicator.adaptive(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: controller.init,
      ),
    );
  }
}
