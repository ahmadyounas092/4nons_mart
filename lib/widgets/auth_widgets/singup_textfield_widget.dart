import 'package:mart_app/constants/export.dart';

Widget signUpTextFieldWidget(BuildContext context) {
  final controller = Get.put(SignUpController());

  return Form(
    key: controller.formKey,
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
                        return "Please enter name!";
                      } else if (value.length < 5) {
                        return "Please enter name at least of 5 characters";
                      }
                      return null;
                    },
                    controller: controller.userNameController,
                    hintText: "Name",
                    labelText: "Name",
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.person,
                  ),
                  20.heightBox,
                  AuthTextfield(
                    obsText: false,
                    isDense: true,
                    controller: controller.emailController,
                    validator: (value) {
                      final RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@(?!temp-mail|10min-mail)[a-zA-Z0-9.-]+\.(com|org|edu|net|gov|mil|int)$",
                      );
                      if (value == null || value.isEmpty) {
                        return "Please enter email address!";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "Please enter a valid email address!";
                      }
                      return null;
                    },
                    hintText: "Email",
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  20.heightBox,
                  Obx(
                    () => AuthTextfield(
                      controller: controller.passwordController,
                      obsText: controller.obs1.value,
                      isDense: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
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
                          controller.obs1.value = !controller.obs1.value;
                        },
                        icon: Icon(
                          controller.obs1.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: indigoColor,
                        ),
                      ),
                    ),
                  ),
                  20.heightBox,
                  Obx(
                    () => AuthTextfield(
                      controller: controller.retypePasswordController,
                      obsText: controller.obs2.value,
                      isDense: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please retype password!";
                        } else if (controller.passwordController.text !=
                            controller.retypePasswordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      labelText: "Retype Password",
                      hintText: "********",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.obs2.value = !controller.obs2.value;
                        },
                        icon: Icon(
                          controller.obs2.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: indigoColor,
                        ),
                      ),
                    ),
                  ),
                  7.5.heightBox,
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isCheck.value,
                          onChanged: (newValue) {
                            controller.isCheck.value = newValue ?? false;
                          },
                        ),
                      ),
                      5.widthBox,
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: "I agree to the ",
                            style: const TextStyle(
                              color: fontGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Terms and Conditions",
                                recognizer: TapGestureRecognizer(),
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: indigoColor,
                                ),
                              ),
                              const TextSpan(text: " & "),
                              TextSpan(
                                text: "Privacy Policy",
                                recognizer: TapGestureRecognizer(),
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: indigoColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  7.5.heightBox,
                  Obx(
                    () => AuthButton(
                      onTap:
                          controller.isLoading.value
                              ? null // Disable button when loading
                              : () {
                                if (!controller.isCheck.value) {
                                  VxToast.show(
                                    context,
                                    msg:
                                        "Please check the checkbox to proceed.",
                                  );
                                  return;
                                }

                                // Validate form fields
                                if (controller.formKey.currentState != null &&
                                    controller.formKey.currentState!
                                        .validate()) {
                                  controller.signup(context);
                                } else {
                                  VxToast.show(
                                    context,
                                    msg:
                                        "Please ensure all fields are filled out correctly.",
                                  );
                                }
                              },
                      buttonName:
                          controller.isLoading.value
                              ? "Signing Up..."
                              : "SignUp",
                      buttonColor:
                          controller.isCheck.value ? tealColor : lightGrey,
                    ),
                  ),
                  10.heightBox,
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: fontGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Login ",
                          recognizer:
                              TapGestureRecognizer()..onTap = () => Get.back(),
                          style: const TextStyle(
                            color: redColor,
                            fontFamily: bold,
                            fontSize: 17,
                          ),
                        ),
                        const TextSpan(text: "now!"),
                      ],
                    ),
                  ),
                ],
              ).box.white.rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .make(),
    ),
  );
}
