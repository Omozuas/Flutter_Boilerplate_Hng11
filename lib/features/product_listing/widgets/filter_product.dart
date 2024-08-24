// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_boilerplate_hng11/features/product_listing/provider/product_provider.dart';

// class FilterDialog {
//   final BuildContext context;
//   final WidgetRef ref;

//   FilterDialog({required this.context, required this.ref});

//   void show() {
//     final productState = ref.read(productProvider);
//     String? selectedCategory = productState.selectedCategory;
//     RangeValues selectedRange = productState.priceRange;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Filter Products'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               DropdownButton<String>(
//                 value: selectedCategory,
//                 hint: const Text('Select Category'),
//                 onChanged: (value) {
//                   selectedCategory = value;
//                 },
//                 items: const [
//                   // DropdownMenuItem(
//                   //     value: 'Electronics', child: Text('Electronics')),
//                   // DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
//                   // DropdownMenuItem(value: 'Home', child: Text('Home')),
//                 ],
//               ),
//               RangeSlider(
//                 values: selectedRange,
//                 min: 0,
//                 max: 1000,
//                 divisions: 10,
//                 labels: RangeLabels(
//                   'NGN${selectedRange.start.round()}',
//                   'NGN${selectedRange.end.round()}',
//                 ),
//                 onChanged: (values) {
//                   selectedRange = values;
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 ref
//                     .read(productProvider.notifier)
//                     .setCategory(selectedCategory);
//                 ref.read(productProvider.notifier).setPriceRange(selectedRange);
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

// void applyFiltersAndSorting() {
//     List<Product> filteredProducts = state.products.where((product) {
//       if (state.selectedCategory != null && product.category != state.selectedCategory) {
//         return false;
//       }
//       if (product.price < state.priceRange.start || product.price > state.priceRange.end) {
//         return false;
//       }
//       return true;
//     }).toList();

//     if (state.sortOption != null) {
//       if (state.sortOption == 'Price: Low to High') {
//         filteredProducts.sort((a, b) => a.price.compareTo(b.price));
//       } else if (state.sortOption == 'Price: High to Low') {
//         filteredProducts.sort((a, b) => b.price.compareTo(a.price));
//       } else if (state.sortOption == 'Rating') {
//         filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
//       }
//     }

//     state = state.copyWith(filteredProducts: filteredProducts);
//   }

//   void setCategory(String? category) {
//     state = state.copyWith(selectedCategory: category);
//     applyFiltersAndSorting();
//   }

//   void setPriceRange(RangeValues range) {
//     state = state.copyWith(priceRange: range);
//     applyFiltersAndSorting();
//   }

//   void setSortOption(String? option) {
//     state = state.copyWith(sortOption: option);
//     applyFiltersAndSorting();
//   }

//   void resetFiltersAndSorting() {
//     state = state.copyWith(
//       selectedCategory: null,
//       priceRange: const RangeValues(0, 1000),
//       sortOption: null,
//       filteredProducts: state.products,
//     );
//   }

// class Product {
//   final String id;
//   final String name;
//   final String category;
//   final double price;
//   final double rating;
//   final String imageUrl;

//   Product({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.rating,
//     required this.imageUrl,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       category: json['category'],
//       price: json['price'].toDouble(),
//       rating: json['rating'].toDouble(),
//       imageUrl: json['imageUrl'],
//     );
//   }
// }
