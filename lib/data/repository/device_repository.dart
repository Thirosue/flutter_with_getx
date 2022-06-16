import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_with_getx/data/model/device/device.dart';

class DeviceRepository {
  Future<void> read() async {
    // FirebaseFirestore.instance.collection('devices').get();
  }

  Future<void> save(Device device) async {
    FirebaseFirestore.instance
        .collection('devices')
        .doc(device.token)
        .set(device.toJson());
  }
}
