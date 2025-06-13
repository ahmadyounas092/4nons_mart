import 'package:mart_app/constants/export.dart';

class HomeController extends GetxController {
  var userName = '';

  final searchController = TextEditingController();

  @override
  void onInit() {
    getuserName();
    super.onInit();
  }

  Future<void> getuserName() async {
    if (currentUser == null) {
      // Handle the null case appropriately (log, return, throw, etc.)
      print('User is not logged in.');
      return;
    }

    var currentUserName = await firestore
        .collection(usersCollection)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
          if (value.docs.isNotEmpty) {
            return value.docs.single["name"];
          } else {
            return ''; // Or handle missing name case
          }
        });

    userName = currentUserName;
  }

}
