import 'package:mart_app/constants/export.dart';


Widget profileButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.5),
    child: Card(
      elevation: 1.0,
      child:
          ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final items = profileButtonsList[index];
                  return ListTile(
                    leading: Image.asset(items["icon"], width: 20),
                    title:
                        "${items["name"]}".text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                    onTap: (){
                      switch (index){
                        case 0:
                          Get.to(()=> OrderScreen());
                          break;
                        case 1:
                          Get.to(()=> WishlistScreen());
                          break;
                        case 2:
                          Get.to(()=> MessagingScreen());
                          break;
                        default:
                      }
                    },
                    focusColor: indigoColor,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: darkFontGrey,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: lightGrey, height: 1);
                },
                itemCount: profileButtonsList.length,
              ).box.white
              .customRounded(BorderRadius.circular(12.5))
              .padding(const EdgeInsets.symmetric(horizontal: 12, vertical: 1))
              .shadowSm
              .make(),
    ),
  );
}
