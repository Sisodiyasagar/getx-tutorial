import 'package:flutter/material.dart';
import 'package:getx_full_tutorial/screens/example_two/Opacity_Controller.dart';
import 'package:get/get.dart';
class Secound_Example extends StatefulWidget {
  const Secound_Example({super.key});

  @override
  State<Secound_Example> createState() => _Secound_ExampleState();
}

class _Secound_ExampleState extends State<Secound_Example> {
  final OpacityControler _OpacityControler=Get.put(OpacityControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secound_Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Container(
            height: 300,
            width: 300,
            color: Colors.blue.withOpacity(_OpacityControler.opacity.value),
          ),),
          Obx(() => Slider(value: _OpacityControler.opacity.value, onChanged: (value) {
            _OpacityControler.setOpacity(value);
          },))
        ],
      ),
    );
  }
}
