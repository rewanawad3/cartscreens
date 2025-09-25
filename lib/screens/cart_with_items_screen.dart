import 'package:flutter/material.dart';
import '../widgets/cart_item_widget.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class CartWithItemsScreen extends StatefulWidget {
  const CartWithItemsScreen({super.key});

  @override
  State<CartWithItemsScreen> createState() => _CartWithItemsScreenState();
}

class _CartWithItemsScreenState extends State<CartWithItemsScreen> {
  int qtyMilkshake = 2;
  int qtyPasta = 1;

  void removeMilkshake() => setState(() => qtyMilkshake = 0);
  void removePasta() => setState(() => qtyPasta = 0);

  double getSubtotal() {
    final milkshakePrice = 20.0;
    final pastaPrice = 12.0;
    return qtyMilkshake * milkshakePrice + qtyPasta * pastaPrice;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = getSubtotal();
    final tax = 5.0;
    final delivery = 3.0;
    final total = subtotal + tax + delivery;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // header
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 18),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(children: const [Icon(Icons.arrow_back, color: Colors.white)]),
                const SizedBox(height: 8),
                Center(child: Text("Cart", style: AppTextStyles.headerTitle)),
                const SizedBox(height: 6),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // items list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                if (qtyMilkshake > 0)
                  CartItemWidget(
                    imagePath: 'assets/images/milkshake.png',
                    title: 'Strawberry Shake',
                    price: '\$20.00',
                    dateTime: '29/11/24 15:00',
                    quantity: qtyMilkshake,
                    onRemove: removeMilkshake,
                    onIncrement: () => setState(() { qtyMilkshake++; }),
                    onDecrement: () => setState(() { if (qtyMilkshake>0) qtyMilkshake--; }),
                  ),
                if (qtyPasta > 0)
                  CartItemWidget(
                    imagePath: 'assets/images/pasta.png',
                    title: 'Broccoli Lasagna',
                    price: '\$12.00',
                    dateTime: '29/11/24 12:00',
                    quantity: qtyPasta,
                    onRemove: removePasta,
                    onIncrement: () => setState(() { qtyPasta++; }),
                    onDecrement: () => setState(() { if (qtyPasta>0) qtyPasta--; }),
                  ),

                const SizedBox(height: 12),

                // summary
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      summaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
                      const Divider(),
                      summaryRow('Tax and Fees', '\$${tax.toStringAsFixed(2)}'),
                      const Divider(),
                      summaryRow('Delivery', '\$${delivery.toStringAsFixed(2)}'),
                      const Divider(),
                      summaryRow('Total', '\$${total.toStringAsFixed(2)}', bold: true),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Checkout button
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/confirm'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightOrange,
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text('Checkout', style: TextStyle(color: Colors.black, fontFamily: 'LeagueSpartan', fontWeight: FontWeight.w700)),
                  ),
                ),

                const SizedBox(height: 24),
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
