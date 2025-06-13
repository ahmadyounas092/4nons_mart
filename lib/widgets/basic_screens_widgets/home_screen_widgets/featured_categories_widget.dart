import 'package:mart_app/constants/export.dart';

Widget featuredCategoriesWidget() {
  return SizedBox(
    height: 60,
    child: ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: featuredList.length,
      itemBuilder: (context, index) {
        final items = featuredList[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 145,
          height: 60,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    items["icon"],
                    fit: BoxFit.contain,
                    width: 55,
                  ),
                ),
                Expanded(
                  child: Text(
                    items["text"],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: bold, color: indigoColor, fontSize: 12.5),
                  ),
                ),
              ],
            ),
          ).onTap(() {
            Get.to(() => CategoryDetailsWidget(categoryTitle: items["text"]));
          }),
        );
      },
    ),
  );
}
