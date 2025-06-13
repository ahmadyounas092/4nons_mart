import '../../constants/export.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.08).heightBox,
                  // app Logo and Text
                  applogoWidget(),
                  10.heightBox,
                  "Join the $appName".text
                      .fontFamily(bold)
                      .size(16)
                      .white
                      .make(),
                  12.5.heightBox,
                  // signup textfields and button to signup
                  signUpTextFieldWidget(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
