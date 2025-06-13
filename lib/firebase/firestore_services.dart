import 'package:mart_app/constants/export.dart';

class FirestoreServices {
  // for getting the user data from firebase firestore
  static getUser(uid) {
    print("Fetching user data for UID: $uid");
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // get products according to the category
  static getProdcts(String category, String subCategory) {
    print(
      "Fetching products for Category: $category, Subcategory: $subCategory",
    );

    var query = firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category);

    if (subCategory.isNotEmpty) {
      query = query.where("p_subcategory", isEqualTo: subCategory);
    }

    return query.snapshots();
  }

  // get the user cart items
  static getCartItems(uid) {
    print("Fetching the uid: $uid");
    return firestore
        .collection(cartCollection)
        .where("addedBy", isEqualTo: uid)
        .snapshots();
  }

  // for deleting the cart items or document
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  // for all chats between seller and the buyer
  static getAllChats(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  // fetching all orders
  static getAllOrders() {
    return firestore
        .collection(ordersCollection)
        .where("order_by", isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // fetching all wishlist data
  static getAllWishlist() {
    return firestore
        .collection(productsCollection)
        .where("p_wishlist", arrayContains: currentUser!.uid)
        .snapshots();
  }

  // fetching all messages
  static getAllMessages() {
    return firestore
        .collection(chatsCollection)
        .where("fromId", isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // ✅ Fixed: getUserCounts with null safety
  static Stream<List<int>> getUserCounts() {
    if (currentUser == null) {
      return Stream.value([0, 0, 0]); // return empty counts if not logged in
    }

    return firestore
        .collection(cartCollection)
        .where("addedBy", isEqualTo: currentUser!.uid)
        .snapshots()
        .asyncExpand((cartSnapshot) {
          int cartCount = cartSnapshot.docs.length;

          return firestore
              .collection(productsCollection)
              .where("p_wishlist", arrayContains: currentUser!.uid)
              .snapshots()
              .asyncExpand((wishlistSnapshot) {
                int wishlistCount = wishlistSnapshot.docs.length;

                return firestore
                    .collection(ordersCollection)
                    .where("order_by", isEqualTo: currentUser!.uid)
                    .snapshots()
                    .map((orderSnapshot) {
                      int orderCount = orderSnapshot.docs.length;
                      return [cartCount, wishlistCount, orderCount];
                    });
              });
        });
  }

  // for the home screen products
  static getAllHomeProducts() {
    return firestore.collection(productsCollection).snapshots();
  }

  // get the featured products
  static getFeaturedProducts() {
    return firestore
        .collection(productsCollection)
        .where("is_featured", isEqualTo: true)
        .snapshots();
  }

  // get searched products
  static getSearchedProducts(String title) {
    return firestore
        .collection(productsCollection)
        .where("p_name", isLessThanOrEqualTo: title)
        .get();
  }
}
