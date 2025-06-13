import 'package:mart_app/constants/export.dart';

class CartController extends GetxController{
  RxInt totalPrice = 0.obs;

  late dynamic productSnapshot;

  void calculateCartTotal(dynamic data){
    totalPrice.value = 0;
    for(var i = 0; i < data.length; i++){
      totalPrice.value = totalPrice.value + int.parse(data[i]["totalPrice"].toString());
    }
  }
}