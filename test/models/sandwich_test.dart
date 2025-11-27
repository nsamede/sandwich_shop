import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    Sandwich veggieDelight = Sandwich(
      type: SandwichType.veggieDelight,
      isFootlong: true,
      breadType: BreadType.wheat,
    );
    Sandwich chickenTeriyaki = Sandwich(
      type: SandwichType.chickenTeriyaki,
      isFootlong: true,
      breadType: BreadType.wheat,
    );
    Sandwich tunaMelt = Sandwich(
      type: SandwichType.tunaMelt,
      isFootlong: true,
      breadType: BreadType.wheat,
    );
    Sandwich meatballMarinara = Sandwich(
      type: SandwichType.meatballMarinara,
      isFootlong: true,
      breadType: BreadType.wheat,
    );
    test('Sandwich name is correct', () {
      expect(veggieDelight.name, "Veggie Delight");
      expect(chickenTeriyaki.name, "Chicken Teriyaki");
      expect(tunaMelt.name, "Tuna Melt");
      expect(meatballMarinara.name, "Meatball Marinara");
    });

    test('Image path is correct', () {
      expect(veggieDelight.image, "assets/images/veggieDelight_footlong.png");
      expect(
        chickenTeriyaki.image,
        "assets/images/chickenTeriyaki_footlong.png",
      );
      expect(tunaMelt.image, "assets/images/tunaMelt_footlong.png");
      expect(
        meatballMarinara.image,
        "assets/images/meatballMarinara_footlong.png",
      );
    });
  });
}
