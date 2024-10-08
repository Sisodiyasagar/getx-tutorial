import 'package:get/get.dart';

class ControllerCrud extends GetxController {
  RxList<Map<String, dynamic>> list = <Map<String, dynamic>>[].obs;

  void addToList(Map<String, dynamic> map) {
    list.add(map);
  }

  void updateList(Map<String, dynamic> map, int index) {
    list[index] = map;
  }

  void delete(int index) {
    list.removeAt(index);
  }
}
