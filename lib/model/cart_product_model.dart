class CartProductModel {
  String? name, image, price, productId;
  int? quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  CartProductModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price =  map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }
}
