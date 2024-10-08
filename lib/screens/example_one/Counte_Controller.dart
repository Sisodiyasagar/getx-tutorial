import 'package:get/get.dart';
class CounterController extends GetxController{
  RxInt n=0.obs;
  void increament(){
    n.value++;
    print(n.value);
  }
}