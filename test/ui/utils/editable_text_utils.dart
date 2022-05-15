// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

// Returns the RenderEditable.
RenderEditable findRenderEditable(WidgetTester tester, int index) {
  final RenderObject root =
      tester.renderObject(find.byType(EditableText).at(index));
  expect(root, isNotNull);

  late RenderEditable renderEditable;
  void recursiveFinder(RenderObject child) {
    if (child is RenderEditable) {
      renderEditable = child;
      return;
    }
    child.visitChildren(recursiveFinder);
  }

  root.visitChildren(recursiveFinder);
  expect(renderEditable, isNotNull);
  return renderEditable;
}

List<TextSelectionPoint> globalize(
    Iterable<TextSelectionPoint> points, RenderBox box) {
  return points.map<TextSelectionPoint>((TextSelectionPoint point) {
    return TextSelectionPoint(
      box.localToGlobal(point.point),
      point.direction,
    );
  }).toList();
}

Offset textOffsetToPosition(WidgetTester tester, int index, int offset) {
  final RenderEditable renderEditable = findRenderEditable(tester, index);
  final List<TextSelectionPoint> endpoints = globalize(
    renderEditable.getEndpointsForSelection(
      TextSelection.collapsed(offset: offset),
    ),
    renderEditable,
  );
  expect(endpoints.length, 1);
  return endpoints[0].point + const Offset(0.0, -2.0);
}
