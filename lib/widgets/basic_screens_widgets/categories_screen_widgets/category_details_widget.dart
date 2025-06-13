import 'package:mart_app/constants/export.dart';

class CategoryDetailsWidget extends StatelessWidget {
  final String categoryTitle;

  const CategoryDetailsWidget({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    // Load subcategories when the widget is first built
    controller.getSubCategories(categoryTitle);

    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: categoryTitle.text.fontFamily(bold).white.make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: whiteColor, size: 25),
            ),
          ],
          iconTheme: const IconThemeData(color: whiteColor),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subcategory Selection Bar
              Obx(() {
                if (controller.subcategoreisList.isEmpty) {
                  return "No subcategories available.".text.makeCentered();
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        controller.subcategoreisList.length,
                            (index) {
                          final subcategory = controller.subcategoreisList[index];
                          final isSelected = controller.selectedSubcategory.value == subcategory ||
                              (subcategory == "All" && controller.selectedSubcategory.value.isEmpty);

                          return GestureDetector(
                            onTap: () {
                              if (subcategory == "All") {
                                controller.updateSubcategory("");
                              } else {
                                controller.updateSubcategory(subcategory);
                              }
                            },
                            child: subcategory.text
                                .fontFamily(semibold)
                                .color(isSelected ? Colors.white : Colors.black)
                                .align(TextAlign.center)
                                .makeCentered()
                                .box
                                .rounded
                                .margin(const EdgeInsets.all(5))
                                .size(125, 50)
                                .padding(const EdgeInsets.symmetric(horizontal: 2.5))
                                .color(isSelected ? indigoColor : whiteColor)
                                .make(),
                          );
                        },
                      ),
                    ).paddingOnly(left: 12, right: 12, top: 12),
                  );
                }
              }),
              15.heightBox,

              // Products List Based on Selected Subcategory
              Obx(() => StreamBuilder(
                stream: FirestoreServices.getProdcts(
                  categoryTitle,
                  controller.selectedSubcategory.value,
                ),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(indigoColor),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: "No Products Found"
                          .text
                          .color(whiteColor)
                          .fontFamily(semibold)
                          .make(),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return categoryItemWidget(context, data);
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
