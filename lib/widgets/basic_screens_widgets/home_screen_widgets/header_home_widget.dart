import 'package:mart_app/constants/export.dart';
import 'package:mart_app/widgets/basic_screens_widgets/home_screen_widgets/home_search_screen.dart';

Widget headerWidget(BuildContext context) {
  final homeController = Get.find<HomeController>();
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Card(
      elevation: 3.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: 2),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
        ),
        child: MyTextField(
          controller: homeController.searchController,
          obsText: false,
          isDense: true,
          hintText: "Search Anything...",
          contentPadding: const EdgeInsets.only(left: 10, top: 15),
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontStyle: FontStyle.italic,
            fontFamily: semibold,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if(homeController.searchController.text.isNotEmptyAndNotNull){
                Get.to(
                      () => HomeSearchScreen(
                    searchTitle: homeController.searchController.text,
                  ),
                );
              }
            },
            icon: Icon(Icons.search, size: 25, color: Colors.blueGrey.shade600),
          ),
          cursorColor: Colors.grey[700],
          textStyle: TextStyle(
            fontFamily: bold,
            color: indigoColor,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
