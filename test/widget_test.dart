import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
    });
  });

  group('OrderScreen - Quantity', () {
    testWidgets('increments quantity when Add is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('decrements quantity when Remove is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('does not decrement below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });
  });

  group('OrderScreen - Controls', () {
    testWidgets('changes bread type with DropdownMenu', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();
      expect(find.textContaining('wheat'), findsNWidgets(2));
      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('wholemeal').last);
      await tester.pumpAndSettle();
      expect(find.textContaining('wholemeal'), findsNWidgets(2));
    });
  });

  group('StyledButton', () {
    testWidgets('renders with icon and label', (WidgetTester tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );
      const testApp = MaterialApp(home: Scaffold(body: testButton));
      await tester.pumpWidget(testApp);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('CartSummary', () {
    testWidgets('displays sandwich card', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pump();

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('card has correct details', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pump();

      expect(
        find.widgetWithText(Card, "Sandwich Type: Veggie Delight"),
        findsOneWidget,
      );
      expect(find.widgetWithText(Card, "Bread Type: white"), findsOneWidget);
      expect(find.widgetWithText(Card, "Size: Footlong"), findsOneWidget);
      expect(find.widgetWithText(Card, "Quantity:"), findsOneWidget);
      expect(find.widgetWithText(Card, "Price: £11"), findsOneWidget);
    });

    testWidgets('price is displayed correcty', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pump();

      expect(find.text('Total: £11'), findsOneWidget);
    });

    testWidgets('sandwich added notification displays correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pump();
      expect(
        find.widgetWithText(
          SnackBar,
          'Added 1 footlong Veggie Delight sandwich(es) on white bread to cart',
        ),
        findsOneWidget,
      );
    });
  });
}
