import '../../constants/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          final shouldExit = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ExitDialog(),
          );
          return shouldExit ?? false;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: context.screenHeight * 0.08),
                    // app Logo and Text
                    applogoWidget(),
                    const SizedBox(height: 10),
                    Text(
                      "Login to $appName",
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12.5),
                    // login textfields and button to login
                    loginTextFieldWidget(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
