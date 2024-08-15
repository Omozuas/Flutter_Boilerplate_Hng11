class ProductDetail {
  const ProductDetail({
    required this.description,
    required this.inStock,
    required this.name,
    required this.price,
    required this.subname,
  });
  final String name, description, subname;
  final num price;
  final bool inStock;
}
