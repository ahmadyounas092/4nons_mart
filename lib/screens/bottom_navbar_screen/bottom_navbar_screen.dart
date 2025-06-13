import '../../constants/export.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavbarController());
    return PopScope(
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
        body: Obx(() => controller.navBody[controller.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => ConvexAppBar(
            height: 50,
            elevation: 1.00,
            style: TabStyle.react,
            items: controller.navItems,
            backgroundColor: whiteColor,
            color: Colors.grey[500],
            activeColor: tealColor,
            initialActiveIndex: controller.currentIndex.value,
            onTap: (int index) {
              controller.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
