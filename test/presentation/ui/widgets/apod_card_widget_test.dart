import 'package:apod_app/core/utils/utils.dart';
import 'package:apod_app/presentation/ui/widgets/apod_card_widget.dart';
import 'package:apod_app/presentation/ui/widgets/custom_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/mocks/fixtures.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('apod card widget ...', (WidgetTester tester) async {
    const key = Key('Apod Card Widget');
    await tester.pumpWidget(
      _makeTestableWidget(ApodCardWidget(
        key: key,
        image: tApodEntity.url,
        title: tApodEntity.title,
        date: tApodEntity.date,
        onTap: () {},
      )),
    );

    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(CustomImageNetworkWidget), findsOneWidget);
    expect(find.text(tApodEntity.title), findsOneWidget);
    expect(find.text(Utils.formatDate(tApodEntity.date)), findsOneWidget);
  });
}
