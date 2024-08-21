import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/localization/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text(StringManager.cartScreen),
      ),
    );
  }
}
