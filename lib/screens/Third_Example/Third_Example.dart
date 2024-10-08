import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_full_tutorial/screens/Third_Example/Swich_Controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Thrid_Example extends StatefulWidget {
  const Thrid_Example({super.key});

  @override
  State<Thrid_Example> createState() => _Thrid_ExampleState();
}

class _Thrid_ExampleState extends State<Thrid_Example> {
  bool value1=false;
  @override
  Widget build(BuildContext context) {
    final Swich_Controller _controller = Get.put(Swich_Controller());
    Future<void> Logout()async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      await pref.remove("token");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Thrid_Example"),
        actions: [
          IconButton(onPressed: (){
            Logout();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("notifications"),
              Obx(() => Switch(value: _controller.isTrue.value, onChanged: (value) {
                _controller.setBool1(value);
              },))
            ],
          ),
        ),
      ),
    );
  }
}
