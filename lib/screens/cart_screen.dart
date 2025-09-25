import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double panelWidth = MediaQuery.of(context).size.width * 0.85;
    final double panelHeight = MediaQuery.of(context).size.height * 0.76;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // header yellow
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 18),
            decoration: const BoxDecoration(
              color: AppColors.headerYellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(children: const [Icon(Icons.arrow_back, color: Colors.white)]),
                const SizedBox(height: 6),
                Center(child: Text("Cart", style: AppTextStyles.headerTitle)),
                const SizedBox(height: 6),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Large orange panel overlay (center)
          Center(
            child: Container(
              width: panelWidth,
              height: panelHeight,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // cart icon (DO NOT tint a full-color PNG)
                  // Use the asset *without* a color parameter:
                  Image.asset('assets/icons/cart.png', width: 48, height: 48),

                  const SizedBox(height: 16),
                  const Text(
                    "Your cart is empty",
                    style: TextStyle(color: Colors.white, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      // go to cart with items (simulate add)
                      Navigator.pushNamed(context, '/cart_items');
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3)
                      ),
                      child: Center(
                        // fallback to built-in icon (safe) instead of tinting a PNG
                        child: const Icon(Icons.add, size: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "Want To Add Something?",
                    style: TextStyle(color: Colors.white, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // user will provide these icons; DO NOT tint them (no color: param)
              Image.asset('assets/icons/home.png', width: 28),
              Image.asset('assets/icons/dish.png', width: 28),
              Image.asset('assets/icons/heart.png', width: 28),
              Image.asset('assets/icons/list.png', width: 28),
              Image.asset('assets/icons/service.png', width: 28),
            ],
          ),
        ),
      ),
    );
  }
}
