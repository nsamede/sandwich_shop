import 'package:sandwich_shop/repositories/order_repository.dart';

class PricingRepository {
  final OrderRepository orderRepository;
  bool isFootlong = false;

  PricingRepository(this.orderRepository);

  int get price {
    if (isFootlong) {
      return orderRepository.quantity * 11;
    } else {
      return orderRepository.quantity * 7;
    }
  }
}
