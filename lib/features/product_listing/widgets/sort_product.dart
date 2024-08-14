// import 'package:flutter/material.dart';
// import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SortDialog {
//   final BuildContext context;
//   final WidgetRef ref;

//   SortDialog({required this.context, required this.ref});

//   void show() {
//     final productState = ref.read(productProvider);
//     String? selectedSortOption = productState.sortOption;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Sort Products'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               RadioListTile<String>(
//                 title: const Text('Price: Low to High'),
//                 value: 'Price: Low to High',
//                 groupValue: selectedSortOption,
//                 onChanged: (value) {
//                   selectedSortOption = value;
//                 },
//               ),
//               RadioListTile<String>(
//                 title: const Text('Price: High to Low'),
//                 value: 'Price: High to Low',
//                 groupValue: selectedSortOption,
//                 onChanged: (value) {
//                   selectedSortOption = value;
//                 },
//               ),
//               RadioListTile<String>(
//                 title: const Text('Rating'),
//                 value: 'Rating',
//                 groupValue: selectedSortOption,
//                 onChanged: (value) {
//                   selectedSortOption = value;
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(productProvider.notifier).setSortOption(selectedSortOption);
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Apply'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
