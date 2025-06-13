import '../../constants/export.dart';

class LogoutDialog extends StatelessWidget {
  final void Function()? onTap;
  const LogoutDialog({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:
          Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.heightBox,
                  "Logout".text
                      .color(indigoColor)
                      .size(18)
                      .fontFamily(bold)
                      .make(),
                  Divider(),
                  10.heightBox,
                  "Are you sure to logout!".text
                      .size(16)
                      .color(redColor)
                      .make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        height: 30,
                        width: 100,
                        textAlign: TextAlign.center,
                        buttonName: "No",
                        borderRadius: BorderRadius.circular(12.5),
                        buttonColor: fontGrey,
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: semibold,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      MyButton(
                        height: 30,
                        width: 100,
                        textAlign: TextAlign.center,
                        buttonName: "Yes",
                        borderRadius: BorderRadius.circular(12.5),
                        buttonColor: redColor,
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: semibold,
                        ),
                        onTap: onTap,
                      ),
                    ],
                  ),
                  10.heightBox,
                ],
              ).box
              .customRounded(BorderRadius.circular(25))
              .color(lightGrey)
              .make(),
    );
  }
}
