import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:achani_ecommerce_mobile/main.dart';
import 'package:achani_ecommerce_mobile/bloc/counter_bloc.dart';

void main() {
  testWidgets('BLoC counter increments', (WidgetTester tester) async {
    // Wrap MyApp in the same provider you use in main()
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => CounterBloc(),
        child: const MyApp(),
      ),
    );

    // Counter should start at 0
    expect(find.text('0'), findsOneWidget);

    // Tap the + FAB and rebuild
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Should find a “1” now
    expect(find.text('1'), findsOneWidget);
  });
}
