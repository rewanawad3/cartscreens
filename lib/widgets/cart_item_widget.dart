import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class CartItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String dateTime;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.dateTime,
    required this.quantity,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.boldBlack),
                  const SizedBox(height: 6),
                  Text(dateTime, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 6),
                  Text(price, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove_circle_outline, color: Colors.grey)),
                    Text(quantity.toString(), style: AppTextStyles.boldBlack),
                    IconButton(onPressed: onIncrement, icon: const Icon(Icons.add_circle_outline, color: AppColors.primary)),
                  ],
                ),
                TextButton(
                  onPressed: onRemove,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text("Cancel Order", style: TextStyle(color: AppColors.primary, fontFamily: 'LeagueSpartan')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
