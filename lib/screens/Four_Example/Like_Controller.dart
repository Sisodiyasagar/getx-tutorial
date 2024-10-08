import 'package:get/get.dart';
class Like_Controller extends GetxController{
  RxList<String> item=["sagar","bhavesh","yash","smit","yogin"].obs;
  RxList<dynamic> tempList=[].obs;

  void setValue(String value){

      tempList.add(value);
    }
   void removeValue(String value){
    tempList.remove(value);
   }
  }
