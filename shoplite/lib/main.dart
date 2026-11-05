import 'package:flutter/material.dart';

void main() {
  runApp(const ShopLiteApp());
}

class ShopLiteApp extends StatelessWidget {
  const ShopLiteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const CartPage(title: 'ShopLite — Сагс' ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.title});

  final String title;

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  static const int _maxCount = 10;

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }


@override
Widget build(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final isFull = _count >= _maxCount;

  return Scaffold(
    appBar: AppBar(
      backgroundColor: colorScheme.inversePrimary,
      title: Text(widget.title),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Badge(
            label: Text('$_count'),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
        IconButton(
          onPressed: _reset,
          tooltip: 'Reset',
          icon: const Icon(Icons.refresh),
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Сагсанд байгаа бараа:'),
          Text(
            '$_count',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (isFull)
            Text(
              'Нэг удаад 10-аас олон бараа захиалах боломжгүй',
              style: TextStyle(color: colorScheme.error),
            ),
        ],
      ),
    ),
    floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
children: [
        FloatingActionButton(
          heroTag: 'add',
          onPressed: isFull ? null : _increment,
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'remove',
          onPressed: _count == 0 ? null : _decrement,
          tooltip: 'Remove',
          child: const Icon(Icons.remove),
        ),
      ],
    ),
  );
}
}
