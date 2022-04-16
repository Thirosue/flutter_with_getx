// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_with_getx/data/model/local_state.dart';

// import '../model/local_state.dart';

// enum StateKey { session }

// class StateRepository {
//   final storage = const FlutterSecureStorage();

//   Future<LocalState> read(String key) async {
//     var json = await storage.read(key: key);
//     if (json != null) {
//       return LocalState.fromJson(jsonDecode(json));
//     } else {
//       return const LocalState(
//         name: 'unknown',
//       );
//     }
//   }

//   void write(String key, LocalState values) async {
//     await storage.write(
//       key: key,
//       value: jsonEncode(values),
//     );
//   }
// }
