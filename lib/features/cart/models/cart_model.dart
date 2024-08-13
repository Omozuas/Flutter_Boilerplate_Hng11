class CartData {
  String? image;
  String? name;
  int? quantity;
  int? price;
  String? description;

  CartData(
      {this.image, this.name, this.quantity, this.price, this.description});

  CartData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] = image;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['description'] = description;
    return data;
  }

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
