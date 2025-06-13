import 'package:firebase_core/firebase_core.dart';
import 'package:mart_app/firebase_options.dart';
import 'constants/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirestoreServices.getUserCounts();

  // initialize the controllers here globally
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(ProductController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(color: whiteColor),
          iconTheme: IconThemeData(color: whiteColor),
        ),
        fontFamily: regular,
      ),
      initialRoute: '/SplashScreen', // Set your initial route here
      getPages: [
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
        GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/SignupScreen', page: () => const SignupScreen()),
        GetPage(
          name: '/BottomNavbarScreen',
          page: () => const BottomNavbarScreen(),
        ),
        GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
        GetPage(
          name: '/CategoriesScreen',
          page: () => const CategoriesScreen(),
        ),
        GetPage(name: '/CartScreen', page: () => const CartScreen()),
        GetPage(name: '/ProfileScreen', page: () => const ProfileScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}
