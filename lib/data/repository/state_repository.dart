import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:hive/hive.dart';

import '../model/local_state.dart';

class StateRepository {
  LocalState read(String key) {
    final state = Hive.box<LocalState>('state').getAt(0);
    if (state != null) {
      return state;
    } else {
      return const LocalState(
        name: 'unknown',
      );
    }
  }

  void write(LocalState value) {
    Hive.box<LocalState>('state').add(value);
  }
}
