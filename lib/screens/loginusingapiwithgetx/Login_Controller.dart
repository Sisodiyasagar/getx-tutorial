import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '';
class Login_contoller extends GetxController {
  RxBool isShow = true.obs;
  Rx<TextEditingController> email = new TextEditingController().obs;
  Rx<TextEditingController> pass = new TextEditingController().obs;

  RxBool isLoading = false.obs;
  Future<void> login(BuildContext context) async {
    try {
      isLoading.value = true;
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email.value.text, "password": pass.value.text});
      print(response.statusCode);
      print(response.body);
      var data =jsonDecode(response.body);
      if(response.statusCode ==200){
        Get.snackbar('login suuceess','');
        saveUser(data["token"]);

        print(data["token"]);
      }else{
        Get.snackbar('login failed','');
      }
    } catch (e) {
      Get.snackbar('Exeception','');
    }
  }
  Future<void> saveUser(String token)async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    if(token.isNotEmpty){
      await pref.setString("token", token);
      Get.snackbar("token saved", '');
    }else{
      Future.error("token is failed");
    }
  }
}
