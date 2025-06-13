import 'package:mart_app/constants/export.dart';

Widget mayLikeProducts(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        featuredProducts.length,
        (index) =>
            Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      featuredProducts[index]["image"],
                      width: 125,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      featuredProducts[index]["product"],
                      style: const TextStyle(
                        color: fontGrey,
                        fontFamily: semibold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      featuredProducts[index]["price"],
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.purple[400],
                        fontFamily: bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ).box.rounded
                .margin(const EdgeInsets.symmetric(horizontal: 5))
                .color(lightGrey)
                .padding(const EdgeInsets.all(8))
                .make(),
      ),
    ),
  );
}
