import 'package:mart_app/constants/export.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  RxBool obs1 = true.obs;
  RxBool obs2 = true.obs;
  RxBool isCheck = false.obs;
  RxBool isLoading = false.obs;

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> signup(context) async {
    if (formKey.currentState!.validate() && isCheck.value) {
      if (passwordController.text != retypePasswordController.text) {
        VxToast.show(context, msg: "Passwords don't match!");
        return;
      }
      isLoading.value = true;

      try {
        UserCredential? userCredential = await AuthController.instance
            .signupMethod(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              context: context,
            );

        if (userCredential != null) {
          await AuthController.instance.storeUserData(
            name: userNameController.text.trim(),
            password: passwordController.text.trim(),
            email: emailController.text.trim(),
          );

          VxToast.show(context, msg: "Sign up successful!");
          // Navigate to the next screen or perform any other action
          Get.offAll(() => const BottomNavbarScreen());
        }
      } catch (e) {
        VxToast.show(context, msg: "An error occurred. Please try again.");
        print("Error during signup: $e"); // Debugging
      } finally {
        isLoading.value = false;
      }
    }
  }
}
