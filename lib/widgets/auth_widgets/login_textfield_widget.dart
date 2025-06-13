import 'package:mart_app/constants/export.dart';

Widget loginTextFieldWidget(BuildContext context) {
  final controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  return Form(
    key: formKey,
    child: Card(
      elevation: 3.0,
      child:
          Column(
                children: [
                  12.5.heightBox,
                  AuthTextfield(
                    obsText: false,
                    isDense: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required!";
                      } else if (!RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    controller: controller.emailController,
                    hintText: "Email",
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  20.heightBox,
                  Obx(
                    () => AuthTextfield(
                      obsText: controller.loginObs.value,
                      controller: controller.passwordController,
                      isDense: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required!";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters!";
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      labelText: "Password",
                      hintText: "********",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.loginObs.value =
                              !controller.loginObs.value;
                        },
                        icon: Icon(
                          controller.loginObs.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: indigoColor,
                        ),
                      ),
                    ),
                  ),
                  7.5.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child:
                          "Forgot Password?".text
                              .fontFamily(bold)
                              .color(Vx.blue400)
                              .size(12.5)
                              .make(),
                    ),
                  ),
                  7.5.heightBox,
                  Obx(
                    () => AuthButton(
                      onTap: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          controller.login(context);
                        } else {
                          print("Validation failed. Check your fields");
                        }
                      },
                      buttonName:
                          controller.isLoading.value ? "Loging in..." : "Login",
                      buttonColor: indigoColor,
                    ),
                  ),
                  7.5.heightBox,
                  // register if not have an account
                  "create a new account".text
                      .fontFamily(semibold)
                      .color(Vx.indigo400)
                      .size(14)
                      .make(),
                  7.5.heightBox,
                  AuthButton(
                    buttonName: "SignUp",
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    buttonColor: tealColor,
                  ),
                  12.5.heightBox,
                  "Login with".text
                      .fontFamily(bold)
                      .color(Vx.neutral400)
                      .size(15)
                      .make(),
                  12.5.heightBox,
                  // Row of Social Icon Buttons, for login
                  const SocialButtons(),
                ],
              ).box.white.rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .make(),
    ),
  );
}
