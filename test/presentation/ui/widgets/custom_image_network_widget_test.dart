import 'package:apod_app/presentation/ui/widgets/custom_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/mocks/fixtures.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('custom image network widget ...', (tester) async {
    const key = Key('Custom image NetWork Widget');

    await tester.pumpWidget(_makeTestableWidget(CustomImageNetworkWidget(
      key: key,
      image: tApodEntity.hdurl,
    )));

    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
