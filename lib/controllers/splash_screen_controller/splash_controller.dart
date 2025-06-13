import 'package:mart_app/constants/export.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    authScreens();
  }

  Future<void> authScreens() async {
    await Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offAll(() => LoginScreen());
        } else {
          Get.offAll(() => BottomNavbarScreen());
        }
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
