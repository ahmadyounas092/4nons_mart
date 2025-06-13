import 'package:mart_app/constants/export.dart';
import 'package:uuid/uuid.dart';

class PaymentController extends GetxController {
  final controller = Get.find<ShippingController>();
  final cartController = Get.find<CartController>();
  final Uuid uuid = Uuid();

  RxInt paymentIndex = 2.obs; // Tracks selected payment method
  RxList products = [].obs; // Stores product details for the order
  RxBool placedOrder = false.obs; // Indicates order placement state
  RxList vendors = [].obs;

  // Change the selected payment method
  void changePaymentIndex(int index) {
    paymentIndex.value = index;
  }

  // Place an order and clear the cart
  Future<void> placeOrder({
    required String orderPaymentMethod,
    required int totalAmount,
  }) async {
    try {
      placedOrder.value = true;

      // Fetch product details
      await getProductDetails();

      // for creating the random order id for the product or for the placed order
      final String orderId = uuid.v6().substring(0, 8);

      // Save order details in Firestore
      await firestore.collection(ordersCollection).doc().set({
        "order_id": orderId,
        "order_by": currentUser!.uid,
        "order_by_name": Get.find<HomeController>().userName,
        "order_by_email": currentUser!.email,
        "order_by_address": controller.addressController.text,
        "order_by_city": controller.cityController.text,
        "order_by_state": controller.stateController.text,
        "order_by_postalcode": controller.postalCodeController.text,
        "order_by_phone": controller.phoneController.text,
        "order_date": DateTime.now(),
        "shipping_method": "Home Delivery",
        "payment_method": orderPaymentMethod,
        "order_placed": true,
        "order_confirmed": false,
        "order_delivered": false,
        "order_on_delivery": false,
        "total_amount": totalAmount,
        "orders": FieldValue.arrayUnion(products),
        "vendors": FieldValue.arrayUnion(vendors.toList()),
      });

      // Clear the cart after placing the order
      await clearCart();

      // Reset state variables
      products.clear();
      cartController.productSnapshot.clear();

      placedOrder.value = false;

      print("Order placed successfully!");
    } catch (e) {
      placedOrder.value = false;
      print("Error while placing order: $e");
    }
  }

  // Fetch product details from cartController
  Future<void> getProductDetails() async {
    products.clear(); // Clear products list before adding new details
    vendors.clear();
    for (var i = 0; i < cartController.productSnapshot.length; i++) {
      products.add({
        "color": cartController.productSnapshot[i]["color"],
        "image": cartController.productSnapshot[i]["image"],
        "quantity": cartController.productSnapshot[i]["quantity"],
        "product_title": cartController.productSnapshot[i]["title"],
        "vendor_id": cartController.productSnapshot[i]["vendor_id"],
        "totalPrice": cartController.productSnapshot[i]["totalPrice"],
      });
      vendors.add(cartController.productSnapshot[i]['vendor_id']);
    }
    print("Products for order: $products");
  }

  // Clear the cart by deleting all Firestore documents
  Future<void> clearCart() async {
    try {
      // Check if the cart is not empty
      if (cartController.productSnapshot != null &&
          cartController.productSnapshot.isNotEmpty) {
        print("Clearing cart...");

        // Convert the iterable to a List of Future operations
        List<Future<void>> deletionTasks =
            cartController.productSnapshot.map((product) async {
              print("Deleting product: ${product.id}");
              return firestore
                  .collection(cartCollection)
                  .doc(product.id)
                  .delete();
            }).toList(); // Explicitly convert to List

        await Future.wait(deletionTasks);

        print("Cart cleared successfully!");
      } else {
        print("Cart is already empty.");
      }
    } catch (e) {
      print("Error while clearing cart: $e");
    }
  }
}
