import 'dart:io';
import 'package:mart_app/constants/export.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // for the edit profile name section

  //for the old password
  RxBool oldObs = true.obs;

  // for the new password obs
  RxBool obs = true.obs;
  RxBool isLoading = false.obs;

  // text editing controllers for the profile name section
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // the old password which user used for the recent login

  final oldPasswordController = TextEditingController();

  // for the new password entered by the user
  final newPasswordController = TextEditingController();

  var profileImagePath = "".obs;
  var profileImageLink = '';

  @override
  void onInit() {
    super.onInit();
    // Initialize text controllers with current user data
    nameController.text = currentUser?.displayName ?? '';
    emailController.text = currentUser?.email ?? '';
    profileImageLink = currentUser?.photoURL ?? '';
  }

  Future<void> changeImage(ImageSource source) async {
    final img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      profileImagePath.value = img.path;
      update();
    }
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: "Gallery".text.make(),
                onTap: () {
                  Get.back();
                  changeImage(ImageSource.gallery);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: "Camera".text.make(),
                onTap: () {
                  Get.back();
                  changeImage(ImageSource.camera);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cancel),
                title: "Cancel".text.make(),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> uploadImage() async {
    if (File(profileImagePath.value).existsSync()) {
      var fileName = basename(profileImagePath.value);
      var destination = 'mart_app/${currentUser!.uid}/$fileName';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileImagePath.value));
      profileImageLink = await ref.getDownloadURL();
      print("Image uploaded with URL: $profileImageLink");
    } else {
      print(
        "File does not exist at the specified path: ${profileImagePath.value}",
      );
      return; // Exit the method if the file does not exist
    }
  }

  Future<void> updateProfile({name, email, password, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      "name": name,
      "email": email,
      "password": password,
      "imgUrl": imgUrl,
    }, SetOptions(merge: true));
    print(
      "Profile updated with new details: Name: $name, Email: $email, Password: $password, Image URL: $imgUrl",
    );
    isLoading(false);
  }

  Future<void> changeAuthEmailPassword({
    newEmail,
    oldPassword,
    newPassword,
  }) async {
    final credentials = EmailAuthProvider.credential(
      email: newEmail,
      password: oldPassword,
    );

    await currentUser!
        .reauthenticateWithCredential(credentials)
        .then((value) {
          currentUser!.verifyBeforeUpdateEmail(newEmail);
          currentUser!.updatePassword(newPassword);
        })
        .catchError((error) {
          print(error.toString());
        });
  }
}
