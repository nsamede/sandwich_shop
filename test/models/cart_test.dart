import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    Cart cart = Cart(maxItems: 5);

    test('Items should not exceed maxItems', () {
      for (int i = 0; i < cart.maxItems + 1; i++) {
        cart.add(
          Sandwich(
            type: SandwichType.veggieDelight,
            isFootlong: true,
            breadType: BreadType.wheat,
          ),
          1,
        );
      }

      expect(cart.maxItems, cart.items);
    });

    test(
      'Adding the same sandwich should increase its quantity, not add a new one',
      () {
        cart.clearCart();

        Sandwich sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        );

        cart.add(sandwich, 1);
        cart.add(sandwich, 1);

        expect(<Sandwich, int>{sandwich: 2}, cart.sandwiches);
      },
    );

    test('Removing the same sandwich should decrease its quantity', () {
      cart.clearCart();

      Sandwich sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );

      cart.add(sandwich, 2);
      cart.removeSandwich(sandwich);

      expect(cart.sandwiches, <Sandwich, int>{sandwich: 1});
    });

    test(
      'Removing a sandwich with quantity 1 should remove it from the cart',
      () {
        cart.clearCart();

        Sandwich sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        );
        cart.add(sandwich, 1);
        cart.removeSandwich(sandwich);

        expect(cart.sandwiches, <Sandwich, int>{});
      },
    );

    test('Cart.clearCart()', () {
      Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      cart.add(sandwich, 2);
      cart.clearCart();

      expect(cart.sandwiches, <Sandwich, int>{});
      expect(cart.items, 0);
    });

    test('Add different sandwiches', () {
      cart.clearCart();

      Sandwich sandwich1 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      Sandwich sandwich2 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      cart.add(sandwich1, 1);
      cart.add(sandwich2, 2);

      expect(cart.sandwiches, <Sandwich, int>{sandwich1: 1, sandwich2: 2});
      expect(cart.items, 3);
    });

    test('Remove different sandwiches', () {
      cart.clearCart();

      Sandwich sandwich1 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      Sandwich sandwich2 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );

      Sandwich sandwich3 = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.add(sandwich1, 1);
      cart.add(sandwich2, 1);
      cart.add(sandwich3, 1);

      cart.removeSandwich(sandwich1);
      cart.removeSandwich(sandwich3);

      expect(cart.sandwiches, <Sandwich, int>{sandwich2: 1});
      expect(cart.items, 1);
    });
  });
}
