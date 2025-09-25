import 'package:flutter/material.dart';
import '../widgets/cart_item_widget.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  )
                ]),
                const SizedBox(height: 8),
                Center(child: Text("Confirm Order", style: AppTextStyles.headerTitle)),
                const SizedBox(height: 6),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text("Shipping Address", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDEFB0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Expanded(child: Text("778 Locust View Drive Oaklanda, CA", style: TextStyle(fontFamily: 'LeagueSpartan'))),
                      Icon(Icons.edit, color: Colors.orange),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Order Summary", style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                    Text("Edit", style: TextStyle(color: Colors.orange, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  ],
                ),

                const SizedBox(height: 12),

                CartItemWidget(
                  imagePath: 'assets/images/milkshake.png',
                  title: 'Strawberry Shake',
                  price: '\$20.00',
                  dateTime: '29 Nov, 15:20 pm',
                  quantity: 2,
                  onRemove: () {},
                  onIncrement: () {},
                  onDecrement: () {},
                ),

                CartItemWidget(
                  imagePath: 'assets/images/pasta.png',
                  title: 'Broccoli Lasagna',
                  price: '\$12.99',
                  dateTime: '29 Nov, 12:00 pm',
                  quantity: 1,
                  onRemove: () {},
                  onIncrement: () {},
                  onDecrement: () {},
                ),

                const SizedBox(height: 12),

                summaryRow('Subtotal', '\$32.00'),
                const Divider(),
                summaryRow('Tax and Fees', '\$5.00'),
                const Divider(),
                summaryRow('Delivery', '\$3.00'),
                const Divider(),
                summaryRow('Total', '\$40.00', bold: true),

                const SizedBox(height: 18),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE0D8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text("Place Order", style: TextStyle(color: Colors.black, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
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

  Widget summaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: bold ? FontWeight.w700 : FontWeight.w400)),
          Text(value, style: TextStyle(fontFamily: 'LeagueSpartan', fontWeight: bold ? FontWeight.w700 : FontWeight.w400)),
        ],
      ),
    );
  }
}
