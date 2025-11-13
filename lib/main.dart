import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < 20; i++)
                    Container(
                      width: 300,
                      height: 100,
                      margin: EdgeInsets.all(20),
                      color: Colors.red,
                      child: Center(child: OrderItemDisplay(3, "BLT")),
                    ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < 20; i++)
                    Container(
                      width: 300,
                      height: 100,
                      margin: EdgeInsets.all(20),
                      color: Colors.red,
                      child: Center(child: OrderItemDisplay(3, "BLT")),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$quantity $itemType sandwich(es): ${'🥪' * quantity}",
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
