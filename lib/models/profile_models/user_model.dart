class UserModel {
  String? name;
  String? email;
  int? cartItems;
  int? wishlistItems;
  int? orderedItems;

  UserModel({
    required this.name,
    required this.email,
    required this.cartItems,
    required this.wishlistItems,
    required this.orderedItems,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      cartItems: data['cartItems'] ?? 0,
      wishlistItems: data['wishlistItems'] ?? 0,
      orderedItems: data['orderedItems'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cartItems': cartItems,
      'wishlistItems': wishlistItems,
      'orderedItems': orderedItems,
    };
  }
}
