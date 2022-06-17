import 'package:apod_app/presentation/ui/widgets/select_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('select date widget ...', (tester) async {
    const key = Key('Select Date Widget');
    const dateMessage = '06-09-2021';

    await tester.pumpWidget(_makeTestableWidget(SelectDateWidget(
      key: key,
      dateMessage: dateMessage,
      onTap: () {},
    )));

    expect(find.byKey(key), findsOneWidget);
    expect(find.text(dateMessage), findsOneWidget);
    expect(find.byIcon(Icons.date_range), findsOneWidget);
  });
}
