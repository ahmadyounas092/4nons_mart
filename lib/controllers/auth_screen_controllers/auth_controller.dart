import 'package:mart_app/constants/export.dart';

class AuthController extends GetxController {
  // create instance of the auth controller for better experience
  static AuthController get instance => Get.find();

  // login method
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? e.toString());
    }
    return userCredential;
  }

  // sign up method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? e.toString());
    }
    return userCredential;
  }

  // storing user data method on the firebase
  Future<void> storeUserData({name, password, email}) async {
    DocumentReference store = firestore
        .collection(usersCollection)
        .doc(auth.currentUser!.uid);

    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imgUrl': "",
      'id': auth.currentUser!.uid,
      'cart_count': "00",
      'wishlist_count': "00",
      'ordered_count': "00",
    });
  }

  // signout method
  Future<void> signOut({context}) async {
    try {
      await auth.signOut();
      // go to your login or auth screens
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? e.toString());
    }
  }
}
