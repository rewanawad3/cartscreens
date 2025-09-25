import 'package:flutter/material.dart';
import 'screens/cart_screen.dart';
import 'screens/cart_with_items_screen.dart';
import 'screens/confirm_order_screen.dart';
import 'screens/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Flow Demo',
      theme: ThemeData(
        fontFamily: 'LeagueSpartan',
        primaryColor: const Color(0xFFE95322),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFE95322)),
      ),
      initialRoute: '/cart',
      routes: {
        '/cart': (context) => const CartScreen(),
        '/cart_items': (context) => const CartWithItemsScreen(),
        '/confirm': (context) => const ConfirmOrderScreen(),
        '/payment': (context) => const PaymentScreen(), //payment
      },
    );
  }
}
