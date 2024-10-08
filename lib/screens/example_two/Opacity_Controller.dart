import 'dart:ffi';

import 'package:get/get.dart';
class OpacityControler extends GetxController{
  RxDouble opacity=0.0.obs;
  void setOpacity(double value){
    opacity.value=value;
    print(opacity.value);
  }
}