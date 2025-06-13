import '../../../constants/export.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: whiteColor),
          title: "Categories".text.fontFamily(bold).white.size(25).make(),
        ),
        // no custom widgets for the categories screen because we have to just show the categories
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: categoriesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 210,
            ),
            itemBuilder: (context, index) {
              final item = categoriesList[index];
              return Column(
                    children: [
                      Image.asset(
                        item["img"],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      Flexible(
                        child:
                            "${item["categoryName"]}".text
                                .align(TextAlign.center)
                                .fontFamily(semibold)
                                .color(Vx.cyan600)
                                .make(),
                      ),
                    ],
                  ).box.white.rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                    controller.getSubCategories(item["categoryName"]);
                    Get.to(
                      () => CategoryDetailsWidget(
                        categoryTitle: item["categoryName"],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
