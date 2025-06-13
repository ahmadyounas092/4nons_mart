import 'package:mart_app/constants/export.dart';

class ChatController extends GetxController {

  @override
  void onInit() {
    getChatId();
    super.onInit();
  }

  final chats = firestore.collection(chatsCollection);

  var sellerName = Get.arguments[0];
  var sellerId = Get.arguments[1];

  var buyerName = Get.find<HomeController>().userName;
  var buyerId = currentUser!.uid;

  final messageController = TextEditingController();

  dynamic chatDocId;

  RxBool isLoading = false.obs;

  Future<void> getChatId() async {

    isLoading.value = true;

    await chats
        .where('users', isEqualTo: {sellerId: null, buyerId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        chatDocId = snapshot.docs.single.id;
      } else {
        chats
            .add({
          "created_on": null,
          "last_msg": "",
          'users': {sellerId: null, buyerId: null},
          'toId': '',
          'fromId': '',
          "seller_Name": sellerName,
          "buyer_Name": buyerName,
        })
            .then((value) {
          chatDocId = value.id;
        });
      }
    });
    isLoading.value = false;
  }

  Future<void> sendMessage(String msg) async {
    if (msg.trim().isNotEmpty) {
      await chats.doc(chatDocId).update({
        "created_on": FieldValue.serverTimestamp(),
        "last_msg": msg,
        "toId": sellerId,
        "fromId": buyerId,
      });

      // Add the new message to the messages collection
      await chats.doc(chatDocId).collection(messagesCollection).doc().set({
        "created_on": FieldValue.serverTimestamp(),
        "msg": msg,
        "uid": buyerId,
      });
    }
  }

}
