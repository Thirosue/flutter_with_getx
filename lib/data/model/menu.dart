// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String title,
    required String path,
    required IconData icon,
    required int index,
  }) = _Menu;
}
