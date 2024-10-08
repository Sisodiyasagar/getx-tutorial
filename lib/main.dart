import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_full_tutorial/screens/Four_Example/Four_Example.dart';
import 'package:getx_full_tutorial/screens/crud_using_getxx/view1.dart';
import 'package:getx_full_tutorial/screens/loginusingapiwithgetx/Login_Using_Apis.dart';
import 'package:getx_full_tutorial/screens/Third_Example/Third_Example.dart';
import 'package:getx_full_tutorial/screens/example_one/First_Example.dart';
import 'package:getx_full_tutorial/screens/example_two/Secound_Example.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build::::::');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get full tutorial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CrudScreen(),
    );
  }
}
class IniateScreen extends StatelessWidget {
  const IniateScreen({super.key});
  Future<bool> getToken()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token=pref.getString("token");
    if(token!=null){
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(future: getToken(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      }else if(snapshot.hasData && snapshot.data== true){
        return Thrid_Example();
      }else{
        return Login_Using_Api();
      }
    },);
  }
}
