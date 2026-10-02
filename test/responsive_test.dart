import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradly/core/utils/responsive.dart';

void main() {
  testWidgets('responsive spacing adapts to phone width', (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    tester.view.devicePixelRatio = 1;

    Future<void> pumpAtWidth(double width) async {
      tester.view.physicalSize = Size(width, 800);
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Text(
              '${Responsive.horizontalPadding(context)}|'
              '${Responsive.isCompact(context)}',
            ),
          ),
        ),
      );
    }

    await pumpAtWidth(320);
    expect(find.text('16.0|true'), findsOneWidget);

    await pumpAtWidth(430);
    expect(find.text('21.5|false'), findsOneWidget);
  });
}
