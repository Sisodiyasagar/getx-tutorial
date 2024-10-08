import 'package:flutter/material.dart';
import 'package:getx_full_tutorial/screens/example_one/Counte_Controller.dart';
import 'package:get/get.dart';
class First_Example extends StatefulWidget {
  const First_Example({super.key});

  @override
  State<First_Example> createState() => _First_ExampleState();
}

class _First_ExampleState extends State<First_Example> {
  // int n=0;
  final CounterController controller=Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("First Example"),
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(onPressed: (){
        controller.increament();
        }, icon: Icon(Icons.add)),
      ),
      body: Center(
        child: Obx((){
          return Text(controller.n.value.toString(),style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold
          ),);
        }
        ),
      ),
    );
  }
}
