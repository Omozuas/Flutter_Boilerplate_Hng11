import 'dart:ui';

class Order {
  Order({
    required this.number,
    required this.image,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.deliveryText,
    required this.deliveryColor,
  });

  final int number;
  final String image;
  final String deliveryDate;
  final String deliveryTime;
  final String deliveryText;
  final Color deliveryColor;
}
