import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sandwich Shop App",
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

enum SandwichType {
  footLong("Footlong"),
  sixInch("Six Inch");

  const SandwichType(this.string);
  final String string;
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  SandwichType _sandwichType = SandwichType.footLong;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  void _setSandwichType(SandwichType sandwichType) {
    setState(() => _sandwichType = sandwichType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sandwich Counter")),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(_quantity, _sandwichType.string),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton(
                  onPressed: _quantity == widget.maxQuantity
                      ? null
                      : _increaseQuantity,
                  text: "Add",
                  icon: Icon(Icons.add_circle_outline_rounded),
                ),
                StyledButton(
                  onPressed: _quantity == 0 ? null : _decreaseQuantity,
                  text: "Remove",
                  icon: Icon(Icons.remove_circle_outline_rounded),
                ),
              ],
            ),
            SegmentedButton(
              segments: <ButtonSegment<SandwichType>>[
                ...SandwichType.values.map(
                  (e) => ButtonSegment<SandwichType>(
                    value: e,
                    label: Text(e.string),
                  ),
                ),
              ],
              selected: <SandwichType>{_sandwichType},
              onSelectionChanged: (Set<SandwichType> newSelection) =>
                  _setSandwichType(newSelection.first),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}

class StyledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Icon? icon;

  const StyledButton({
    super.key,
    required this.onPressed,
    this.text = "",
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Theme.of(context).primaryTextTheme.labelSmall?.color,
      ),
      child: icon == null ? Text(text) : Row(children: [icon!, Text(" $text")]),
    );
  }
}
