import '../repositories/pricing_repository.dart';
import 'sandwich.dart';

class Cart {
  final int maxItems;
  int _items = 0;

  final Map<Sandwich, int> _sandwiches = {};

  Cart({required this.maxItems});

  int get items => _items;
  Map<Sandwich, int> get sandwiches => _sandwiches;

  void addSandwich(Sandwich sandwich, int quantity) {
    if (_items + quantity <= maxItems) {
      // If the same sandwich is already in the cart, just increase the quantity.
      if (_sandwiches.containsKey(sandwich)) {
        _sandwiches[sandwich] = _sandwiches[sandwich]! + quantity;
      } else {
        _sandwiches[sandwich] = quantity;
      }

      _items += quantity;
    } else {
      // If the amount of items would be larger than maxItems, reduce the quantity.
      // In other words, add as many as we can without going over maxItems.
      int reducedQuantity = maxItems - _items;

      if (_sandwiches.containsKey(sandwich)) {
        _sandwiches[sandwich] = _sandwiches[sandwich]! + reducedQuantity;
      } else {
        _sandwiches[sandwich] = reducedQuantity;
      }

      _items += reducedQuantity;
    }
  }

  void removeSandwich(Sandwich sandwich) {
    if (_sandwiches.containsKey(sandwich)) {
      if (_sandwiches[sandwich] == 1) {
        // Remove the sandwich from the cart if there is only 1.
        _sandwiches.remove(sandwich);
      } else {
        // Otherwise just decrease the quantity.
        _sandwiches[sandwich] = _sandwiches[sandwich]! - 1;
      }
    }
  }

  void clearCart() {
    _sandwiches.clear();
    _items = 0;
  }

  double get total {
    double total = 0;
    _sandwiches.forEach((Sandwich sandwich, int quantity) {
      total += PricingRepository().calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    });

    return total;
  }
}
