import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:can_lua/app.dart';

void main() {
  testWidgets('App smoke test - renders NavigationShell', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: CanLuaApp(),
      ),
    );

    // Verify that NavigationShell is pumped and bottom navigation bar is present
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
