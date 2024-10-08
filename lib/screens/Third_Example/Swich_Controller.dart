import 'package:get/get.dart';
class Swich_Controller extends GetxController{
  RxBool isTrue=false.obs;
  
  void setBool1(bool value){
    isTrue.value=value;
    print(isTrue.value);
  }
}