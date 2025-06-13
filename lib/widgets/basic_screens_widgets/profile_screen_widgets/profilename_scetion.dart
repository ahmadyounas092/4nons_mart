import 'package:mart_app/constants/export.dart';

Widget profileNameSection(BuildContext context) {
  final controller = Get.put(AuthController());
  final profileController = Get.put(ProfileController());

  // ✅ Check if currentUser is null
  if (currentUser == null) {
    return const Center(
      child: Text(
        "User not logged in.",
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  return StreamBuilder(
    stream: FirestoreServices.getUser(currentUser!.uid),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
          ),
        );
      } else if (snapshot.data!.docs.isEmpty) {
        return const Center(child: Text("No user data found"));
      } else {
        var data = snapshot.data!.docs[0];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: whiteColor),
              ).onTap(() {
                profileController.nameController.text = data['name'];
                profileController.emailController.text = data['email'];
                Get.to(() => EditProfileScreen(data: data));
              }),
              2.5.heightBox,
              Row(
                children: [
                  data["imgUrl"].isEmpty
                      ? Icon(Icons.person, size: 50).box.white.roundedFull
                          .clip(Clip.antiAlias)
                          .padding(const EdgeInsets.all(2.5))
                          .make()
                      : Image.network(
                            data["imgUrl"],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ).box.white.roundedFull
                          .clip(Clip.antiAlias)
                          .padding(const EdgeInsets.all(2.5))
                          .make(),
                  7.5.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${data['name']}".text
                            .fontFamily(semibold)
                            .white
                            .make(),
                        4.heightBox,
                        "${data['email']}".text.white
                            .fontFamily(semibold)
                            .make(),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: whiteColor),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return LogoutDialog(
                            onTap: () {
                              controller.signOut();
                            },
                          );
                        },
                      );
                    },
                    child: "Logout".text.fontFamily(semibold).white.make(),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    },
  );
}
