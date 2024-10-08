import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_full_tutorial/screens/Four_Example/Like_Controller.dart';

class FourExample extends StatefulWidget {
  const FourExample({super.key});

  @override
  State<FourExample> createState() => _FourExampleState();
}

class _FourExampleState extends State<FourExample> {
  final Like_Controller controller = Get.put(Like_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Four example"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: controller.item.value.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.item.value[index]),
                Obx(() => IconButton(
                    onPressed: () {
                      if(controller.tempList.contains(controller.item[index].toString())){
                        controller.removeValue(controller.item[index].toString());
                      }else{
                        controller.setValue(controller.item[index].toString());
                      }
                    },
                    icon: Obx(() => Icon(
                      CupertinoIcons.heart_fill,
                      color: controller.tempList.value
                          .contains(controller.item.value[index].toString())
                          ? Colors.red
                          : Colors.white,
                    ))))
              ],
            ),
          );
        },
      )),
    );
  }
}
