import 'package:mart_app/constants/export.dart';

class ProductController extends GetxController {
  RxInt quantity = 0.obs;
  RxInt colorIndex = 0.obs;
  RxInt totalPrice = 0.obs;

  RxBool isFavourite = false.obs;

  var subcategoreisList = <String>[].obs; // Made reactive
  var selectedSubcategory = "".obs;

  Future<void> getSubCategories(String title) async {
    subcategoreisList.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);

    var sc = decoded.categories.where((element) => element.name == title).toList();

    if (sc.isNotEmpty) {
      subcategoreisList.add("All"); // 👈 Add this line
      subcategoreisList.addAll(sc[0].subcategories);
    }

    selectedSubcategory.value = ""; // 👈 Default to "All"
  }


  void updateSubcategory(String subCategory){
    selectedSubcategory.value = subCategory;
  }

  void changeColorIndex(int index) {
    colorIndex.value = index;
  }

  void increaseQunatity(int totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  void calculateTotalPrice(double price) {
    totalPrice.value = (price * quantity.value).toInt();
  }

  Future<void> addToCart({
    required String title,
    required String image,
    required String sellerName,
    required int color,
    required int quantity,
    required int totalPrice,
    required String vendorId,
    required BuildContext context,
  }) async {
    if (quantity > 0) {
      // Check if quantity is greater than zero
      await firestore
          .collection(cartCollection)
          .doc()
          .set({
            "title": title,
            "image": image,
            "sellerName": sellerName,
            "color": color,
            "quantity": quantity,
            "totalPrice": totalPrice,
            "vendor_id": vendorId,
            "addedBy": currentUser!.uid,
          })
          .then((value) {
            VxToast.show(context, msg: "Successfully added to cart");
          })
          .catchError((error) {
            VxToast.show(context, msg: error.toString());
          });
    } else {
      VxToast.show(context, msg: "Please select at least one quantity.");
    }
  }

  void resetProductQuantity() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }

  Future<void> addtoWishList(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      "p_wishlist": FieldValue.arrayUnion([currentUser!.uid]),
    }, SetOptions(merge: true));
    isFavourite.value = true;
  }

  Future<void> removeFromWishList(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      "p_wishlist": FieldValue.arrayRemove([currentUser!.uid]),
    }, SetOptions(merge: true));
    isFavourite.value = false;
  }

  Future<void> checkifFavourite(dynamic data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      isFavourite.value = true;
    } else {
      isFavourite.value = false;
    }
  }
}
