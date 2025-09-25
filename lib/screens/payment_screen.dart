import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // header
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 18),
            decoration: const BoxDecoration(
              color: AppColors.headerYellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.white))
                ]),
                const SizedBox(height: 8),
                Center(child: Text("Payment", style: AppTextStyles.headerTitle)),
                const SizedBox(height: 6),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text("Shipping Address", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(color: const Color(0xFFFDEFB0), borderRadius: BorderRadius.circular(20)),
                  child: const Text("778 Locust View Drive Oaklanda, CA", style: TextStyle(fontFamily: 'LeagueSpartan')),
                ),

                const SizedBox(height: 20),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                  Text("Order Summary", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  Text("Edit", style: TextStyle(color: Colors.orange, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                ]),

                const SizedBox(height: 12),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset('assets/images/milkshake.png', width: 60, height: 60),
                  title: const Text('Strawberry Shake', style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  subtitle: const Text('2 items', style: TextStyle(fontFamily: 'LeagueSpartan')),
                  trailing: const Text('\$20.00', style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset('assets/images/pasta.png', width: 60, height: 60),
                  title: const Text('Broccoli Lasagna', style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  subtitle: const Text('1 items', style: TextStyle(fontFamily: 'LeagueSpartan')),
                  trailing: const Text('\$12.99', style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                ),

                const SizedBox(height: 12),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Payment Method", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.orange, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)))
                ]),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/card.png', width: 36, height: 36),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Credit Card', style: TextStyle(fontFamily: 'LeagueSpartan'))),
                      const Text('**** 43 /00/000', style: TextStyle(fontFamily: 'LeagueSpartan')),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                  Text("Delivery Time", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  Text("25 mins", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700, color: AppColors.primary)),
                ]),

                const SizedBox(height: 28),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment Complete - demo")));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightOrange,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Pay Now", style: TextStyle(color: Colors.black, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppColors.primary,
        child: SizedBox(height: 64, child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset('assets/icons/home.png', width: 28),
          Image.asset('assets/icons/dish.png', width: 28),
          Image.asset('assets/icons/heart.png', width: 28),
          Image.asset('assets/icons/list.png', width: 28),
          Image.asset('assets/icons/service.png', width: 28),
        ])),
      ),
    );
  }
}
