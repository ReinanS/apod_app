import 'package:apod_app/presentation/ui/widgets/rounded_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('rounded background widget ...', (tester) async {
    const key = Key('Rounded Background Widget');

    await tester.pumpWidget(_makeTestableWidget(RoundedBackgroundWidget(
      key: key,
      height: 40,
      child: Container(),
    )));

    expect(find.byKey(key), findsOneWidget);
  });
}
