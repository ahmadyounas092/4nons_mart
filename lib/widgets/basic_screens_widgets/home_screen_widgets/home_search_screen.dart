import '../../../constants/export.dart';

class HomeSearchScreen extends StatelessWidget {
  final String? searchTitle;

  const HomeSearchScreen({super.key, this.searchTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => HomeScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title:
            (searchTitle ?? "Search").text
                .fontFamily(bold)
                .color(darkFontGrey)
                .make(),
        backgroundColor: Colors.blueGrey[50],
        iconTheme: IconThemeData(color: darkFontGrey),
      ),
      body: FutureBuilder(
        future: FirestoreServices.getSearchedProducts(searchTitle ?? ""),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(indigoColor),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error fetching data"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No Products Found!"));
          } else {
            var data = snapshot.data!.docs;

            // Ensure searchTitle is not null before filtering
            var filteredSearchData =
                searchTitle == null
                    ? data
                    : data
                        .where(
                          (element) => element["p_name"]
                              .toString()
                              .toLowerCase()
                              .contains(searchTitle!.toLowerCase()),
                        )
                        .toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                itemCount: filteredSearchData.length, // Fixed `itemCount`
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 260,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final searchData = filteredSearchData[index]; // Fixed here
                  return Card(
                    elevation: 4.0,
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                searchData["p_imgs"][0], // Corrected this
                                width: 200,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Spacer(),
                            "${searchData["p_name"]}".text
                                .size(18)
                                .fontFamily(bold)
                                .make(),
                            0.5.heightBox,
                            "${searchData["p_price"]}".numCurrency.text
                                .fontFamily(bold)
                                .size(15)
                                .color(Vx.cyan400)
                                .make(),
                            10.heightBox,
                          ],
                        ).box.rounded
                        .padding(const EdgeInsets.all(12))
                        .white
                        .make()
                        .onTap(() {
                          Get.to(
                            () => ItemDetailsWidget(
                              itemTitle: "${searchData["p_name"]}",
                              itemPrice: "${searchData["p_price"]}",
                              itemImages: List<String>.from(
                                searchData["p_imgs"],
                              ),
                              data: searchData,
                            ),
                          );
                        }),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
