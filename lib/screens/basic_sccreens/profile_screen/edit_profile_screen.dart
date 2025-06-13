import 'dart:io';
import 'package:mart_app/constants/export.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return bgWidget(
      Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () =>
                            controller.profileImagePath.isEmpty
                                ? (data['imgUrl'] != null &&
                                        data['imgUrl'].isNotEmpty
                                    ? Image.network(
                                          data['imgUrl'],
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ).box.white.roundedFull
                                        .clip(Clip.antiAlias)
                                        .border(color: darkFontGrey, width: 1.5)
                                        .padding(const EdgeInsets.all(2.5))
                                        .make()
                                    : Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: darkFontGrey,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ))
                                : (File(
                                      controller.profileImagePath.value,
                                    ).existsSync()
                                    ? Image.file(
                                          File(
                                            controller.profileImagePath.value,
                                          ),
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ).box.white.roundedFull
                                        .clip(Clip.antiAlias)
                                        .border(color: darkFontGrey, width: 1.5)
                                        .padding(const EdgeInsets.all(2.5))
                                        .make()
                                    : Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: darkFontGrey,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    )),
                      ),
                      7.5.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            width: 60,
                            buttonName: 'Edit',
                            buttonColor: indigoColor,
                            onTap: () {
                              controller.showImagePicker(context);
                            },
                            padding: EdgeInsets.symmetric(
                              horizontal: 7.5,
                              vertical: 2.5,
                            ),
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: semibold,
                            ),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          5.widthBox,
                          MyButton(
                            width: 60,
                            buttonName: "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: semibold,
                            ),
                            buttonColor: indigoColor,
                            borderRadius: BorderRadius.circular(12.5),
                            padding: EdgeInsets.symmetric(
                              vertical: 2.5,
                              horizontal: 7.5,
                            ),
                            onTap: () async {
                              controller.isLoading.value = true;
                              if (controller
                                  .profileImagePath
                                  .value
                                  .isNotEmpty) {
                                await controller.uploadImage();
                                VxToast.show(
                                  context,
                                  msg: "Profile picture updated!",
                                );
                              } else {
                                VxToast.show(
                                  context,
                                  msg: "No new profile picture selected.",
                                );
                              }
                              controller.update();
                              controller.isLoading.value = false;
                            },
                          ),
                        ],
                      ),
                      7.5.heightBox,
                      Divider(),
                      20.heightBox,
                      MyTextField(
                            obsText: false,
                            controller: controller.nameController,
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: lightGrey,
                              fontSize: 15,
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(
                              color: fontGrey,
                              fontFamily: semibold,
                            ),
                            contentPadding: EdgeInsets.only(left: 12, top: 2),
                          ).box
                          .customRounded(BorderRadius.circular(12.5))
                          .border(color: darkFontGrey, width: 1)
                          .color(whiteColor)
                          .padding(EdgeInsets.all(1))
                          .make(),
                      15.heightBox,
                      MyTextField(
                            obsText: false,
                            controller: controller.emailController,
                            hintText: "New Email",
                            hintStyle: TextStyle(
                              color: lightGrey,
                              fontSize: 15,
                            ),
                            labelText: "New Email",
                            labelStyle: TextStyle(
                              color: fontGrey,
                              fontFamily: semibold,
                            ),
                            contentPadding: EdgeInsets.only(left: 12, top: 2),
                          ).box
                          .customRounded(BorderRadius.circular(12.5))
                          .border(color: darkFontGrey, width: 1)
                          .color(whiteColor)
                          .padding(EdgeInsets.all(1))
                          .make(),
                      15.heightBox,
                      Obx(
                        () =>
                            MyTextField(
                                  obsText: controller.oldObs.value,
                                  controller: controller.oldPasswordController,
                                  hintText: "********",
                                  hintStyle: TextStyle(
                                    color: lightGrey,
                                    fontSize: 15,
                                  ),
                                  labelText: "Enter old password",
                                  labelStyle: TextStyle(
                                    color: fontGrey,
                                    fontFamily: semibold,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 12,
                                    top: 2,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.oldObs.value =
                                          !controller.oldObs.value;
                                    },
                                    icon: Icon(
                                      controller.oldObs.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ).box
                                .customRounded(BorderRadius.circular(12.5))
                                .color(whiteColor)
                                .border(color: darkFontGrey, width: 1)
                                .padding(EdgeInsets.all(1))
                                .make(),
                      ),
                      15.heightBox,
                      Obx(
                        () =>
                            MyTextField(
                                  obsText: controller.obs.value,
                                  controller: controller.newPasswordController,
                                  hintText: "********",
                                  hintStyle: TextStyle(
                                    color: lightGrey,
                                    fontSize: 15,
                                  ),
                                  labelText: "Enter new password",
                                  labelStyle: TextStyle(
                                    color: fontGrey,
                                    fontFamily: semibold,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 12,
                                    top: 2,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.obs.value =
                                          !controller.obs.value;
                                    },
                                    icon: Icon(
                                      controller.obs.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ).box
                                .customRounded(BorderRadius.circular(12.5))
                                .color(whiteColor)
                                .border(color: darkFontGrey, width: 1)
                                .padding(EdgeInsets.all(1))
                                .make(),
                      ),
                      15.heightBox,
                      Obx(
                        () =>
                            controller.isLoading.value
                                ? CircularProgressIndicator()
                                : MyButton(
                                  buttonName: "Save Changes",
                                  buttonColor: redColor,
                                  borderRadius: BorderRadius.circular(10),
                                  padding: const EdgeInsets.all(10),
                                  onTap: () async {
                                    controller.isLoading.value = true;
                                    print("Starting image upload...");

                                    // Ensure profile image path is valid
                                    if (controller
                                        .profileImagePath
                                        .value
                                        .isNotEmpty) {
                                      await controller.uploadImage();
                                    } else {
                                      controller.profileImageLink =
                                          data['imgUrl'];
                                    }

                                    // Check if the old password matches with the password in the database
                                    if (data['password'] ==
                                        controller.oldPasswordController.text) {
                                      await controller.changeAuthEmailPassword(
                                        newEmail: currentUser!.email,
                                        oldPassword:
                                            controller
                                                .oldPasswordController
                                                .text,
                                        newPassword:
                                            controller
                                                .newPasswordController
                                                .text,
                                      );
                                      await controller.updateProfile(
                                        imgUrl: controller.profileImageLink,
                                        name: controller.nameController.text,
                                        email: controller.emailController.text,
                                        password:
                                            controller
                                                .newPasswordController
                                                .text,
                                      );
                                      controller.isLoading.value = false;
                                      VxToast.show(
                                        context,
                                        msg: "Update Complete!",
                                      );
                                      // Clear password fields after update
                                      controller.oldPasswordController.clear();
                                      controller.newPasswordController.clear();
                                    } else {
                                      VxToast.show(
                                        context,
                                        msg:
                                            "Please enter the correct old password to continue!",
                                      );
                                      controller.isLoading.value = false;
                                    }
                                  },
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontFamily: bold,
                                    fontSize: 16,
                                  ),
                                ),
                      ),
                    ],
                  ).box.shadowSm.white
                  .padding(EdgeInsets.all(16))
                  .margin(EdgeInsets.only(top: 50, left: 8, right: 8))
                  .customRounded(BorderRadius.circular(12.5))
                  .make(),
        ),
      ),
    );
  }
}
