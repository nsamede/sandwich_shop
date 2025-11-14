import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group("PricingRepository", () {
    test("initial price should be 0", () {
      final orderRepository = OrderRepository(maxQuantity: 5);
      final pricingRepository = PricingRepository(orderRepository);
      expect(pricingRepository.price, 0);
    });
    test("adding a footlong sandwich should increase price by 11", () {
      final orderRepository = OrderRepository(maxQuantity: 5);
      final pricingRepository = PricingRepository(orderRepository);
      pricingRepository.isFootlong = true;
      orderRepository.increment();
      expect(pricingRepository.price, 11);
    });
    test("adding a six-inch sandwich should increase price by 7", () {
      final orderRepository = OrderRepository(maxQuantity: 5);
      final pricingRepository = PricingRepository(orderRepository);
      pricingRepository.isFootlong = false;
      orderRepository.increment();
      expect(pricingRepository.price, 7);
    });
  });
}
