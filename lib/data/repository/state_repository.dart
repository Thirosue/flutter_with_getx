import 'dart:convert';

import 'package:flutter_with_getx/data/const/state_key.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:get_storage/get_storage.dart';

import '../model/local_state.dart';

class StateRepository {
  LocalState read() {
    var json = GetStorage().read(StateKey.store);
    if (json != null) {
      return LocalState.fromJson(jsonDecode(json));
    } else {
      return const LocalState(
        token: 'dummy',
      );
    }
  }

  void save(LocalState value) {
    GetStorage().write(StateKey.store, jsonEncode(value));
  }
}
