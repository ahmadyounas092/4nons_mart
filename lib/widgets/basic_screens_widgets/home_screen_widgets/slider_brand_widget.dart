import 'package:mart_app/constants/export.dart';

Widget sliderBrandWidget(BuildContext context) {
  // you can use listView.builder instead of the VxSwiper.builder because both do same functionalities
  // VxSwiper is due to Velocity_x package from pub dev
  return VxSwiper.builder(
    enableInfiniteScroll: true,
    scrollDirection: Axis.horizontal,
    enlargeCenterPage: true,
    autoPlay: true,
    height: 175,
    aspectRatio: 16 / 2,
    itemCount: brandList.length,
    itemBuilder: (context, index) {
      final image = brandList[index];
      return Image.asset(image, fit: BoxFit.fill).box.rounded
          .clip(Clip.antiAlias)
          .margin(const EdgeInsets.symmetric(horizontal: 10))
          .make();
    },
  );
}
