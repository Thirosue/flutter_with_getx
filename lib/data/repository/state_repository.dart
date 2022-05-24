import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:hive/hive.dart';

import '../model/local_state.dart';

class StateRepository {
  LocalState read() {
    final store = Hive.box<LocalState>('state');
    if (store.isEmpty || store.getAt(0) == null) {
      return const LocalState(
        name: 'unknown',
      );
    } else {
      return store.getAt(0)!;
    }
  }

  void write(LocalState value) {
    Hive.box<LocalState>('state').add(value);
  }
}
