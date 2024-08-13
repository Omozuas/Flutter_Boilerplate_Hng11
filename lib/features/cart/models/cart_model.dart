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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }

  void updateQuantity(int newQuantity) {
    this.quantity = newQuantity;
  }
}
