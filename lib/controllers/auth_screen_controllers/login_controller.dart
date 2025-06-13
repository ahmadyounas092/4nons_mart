import 'package:mart_app/constants/export.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  RxBool loginObs = true.obs; // For password visibility
  RxBool isLoading = false.obs; // For loading state

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(context) async {
    isLoading.value = true;

    try {
      UserCredential? userCredential = await AuthController.instance
          .loginMethod(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            context: context,
          );

      if (userCredential != null) {
        // Clear the text fields after successful login
        emailController.clear();
        passwordController.clear();

        // Show success message
        VxToast.show(context, msg: "Login Successful!");

        // Navigate to the home screen or any other screen
        Get.offAll(() => const BottomNavbarScreen());

        Get.snackbar("Loggedin", "Login Successful");
      }
    } catch (e) {
      // Show error message
      VxToast.show(context, msg: "Email or Password is incorrect!");
      print("Error during login: $e"); // Debugging
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }
}
