import 'package:mart_app/constants/export.dart';

class BottomNavbarController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<TabItem> navItems = [
    TabItem(
      icon: Image.asset(icHome, width: 26),
      title: home,
      activeIcon: Image.asset(icHome, color: tealColor),
    ),
    TabItem(
      icon: Image.asset(icCategories, width: 26),
      title: categories,
      activeIcon: Image.asset(icCategories, color: tealColor),
    ),
    TabItem(
      icon: Image.asset(icCart, width: 26),
      title: cart,
      activeIcon: Image.asset(icCart, color: tealColor),
    ),
    TabItem(
      icon: Image.asset(icProfile, width: 26),
      title: profile,
      activeIcon: Image.asset(icProfile, color: tealColor),
    ),
  ];
  List<Widget> navBody = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}
