import '../../constants/export.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShippingController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: darkFontGrey),
        title:
            "Shipping Info".text
                .fontFamily(semibold)
                .color(darkFontGrey)
                .make(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    MyTextField(
                      obsText: false,
                      labelText: "Address",
                      controller: controller.addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Address is required.";
                        } else if (value.length < 15) {
                          return "Address must be at least 15 characters long.";
                        }
                        return null;
                      },
                      labelStyle: TextStyle(
                        color: indigoColor, // Ensure label color is indigo
                        fontFamily: semibold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: indigoColor,
                          width: 2,
                        ), // Fixed here
                      ),
                    ),
                    MyTextField(
                      obsText: false,
                      labelText: "City",
                      controller: controller.cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "City is required.";
                        }
                        return null;
                      },
                      labelStyle: TextStyle(
                        color: indigoColor,
                        fontFamily: semibold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: indigoColor,
                          width: 2,
                        ), // Fixed here
                      ),
                    ),
                    MyTextField(
                      obsText: false,
                      labelText: "State",
                      controller: controller.stateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "State is required.";
                        }
                        return null;
                      },
                      labelStyle: TextStyle(
                        color: indigoColor,
                        fontFamily: semibold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: indigoColor,
                          width: 2,
                        ), // Fixed here
                      ),
                    ),
                    MyTextField(
                      obsText: false,
                      labelText: "Postal Code",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Postal code is required.";
                        } else if (value.length != 5 ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Postal code must be exactly 5 digits.";
                        }
                        return null;
                      },
                      controller: controller.postalCodeController,
                      labelStyle: TextStyle(
                        color: indigoColor,
                        fontFamily: semibold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: indigoColor,
                          width: 2,
                        ), // Fixed here
                      ),
                    ),
                    MyTextField(
                      obsText: false,
                      labelText: "Phone",
                      controller: controller.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone number is required.";
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return "Phone number must be 10 digits.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      labelStyle: TextStyle(
                        color: indigoColor,
                        fontFamily: semibold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: indigoColor,
                          width: 2,
                        ), // Fixed here
                      ),
                    ),
                  ],
                ),
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  text: "Note : ",
                  style: TextStyle(color: fontGrey, fontFamily: semibold),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "This app works only in Pakistan. So, please add details if you're from Pakistan!",
                      style: TextStyle(fontFamily: regular, color: tealColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyButton(
        buttonName: "Continue",
        borderRadius: BorderRadius.circular(12.5),
        buttonColor: redColor,
        style: TextStyle(color: whiteColor, fontFamily: semibold),
        height: 50,
        width: double.infinity,
        onTap: () {
          Get.put(PaymentController());
          if (controller.formKey.currentState!.validate()) {
            Get.to(PaymentMethod());
          } else {
            VxToast.show(context, msg: "Please fill all fields correctly!");
          }
        },
      ),
    );
  }
}
