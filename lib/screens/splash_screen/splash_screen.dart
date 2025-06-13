import '../../constants/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    controller.authScreens();
    return Scaffold(
      backgroundColor: indigoColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            100.heightBox,
            applogoWidget(),
            10.heightBox,
            appName.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appVersion.text.color(Vx.gray400).size(5).make(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Created by:")
                      .text
                      .color(Vx.gray400)
                      .size(3)
                      .make(),
                  5.widthBox,
                  credit.text.fontFamily(bold).color(Vx.gray400).size(3).make(),
                ],
              ),
            ),
            5.heightBox
          ],
        ),
      ),
    );
  }
}
