import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:getx_full_tutorial/screens/loginusingapiwithgetx/Login_Controller.dart';
class Login_Using_Api extends StatefulWidget {
  const Login_Using_Api({super.key});

  @override
  State<Login_Using_Api> createState() => _Login_Using_ApiState();
}

class _Login_Using_ApiState extends State<Login_Using_Api> {
  GlobalKey<FormState> fromkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Login_contoller controller =Get.put(Login_contoller());
    return Scaffold(
      body: SafeArea(child: Form(
        key: fromkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FadeInDown(
                from: 250,
                duration: Duration(milliseconds: 950),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.23,
                  child: Padding(
                    padding: const EdgeInsets.all(37),
                  //  child: Image.asset('assets/images/withoutbg.png',fit: BoxFit.cover),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    color: Color.fromRGBO(33, 55, 80, 0.79),
                  ),
                ),
              ),
              FadeInRight(
                from: 100,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 35),
                  child: TextFormField(
                    showCursor: true,
                    autocorrect: true,
                    controller: controller.email.value,
                    validator: (value) {
                      if(value == null && value!.isEmpty){
                          return "enter email here";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        label: Text('Email'),
                        prefixIcon: Icon(Icons.email),
                        hoverColor: Colors.white,
                        focusColor: Colors.blueGrey,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        contentPadding: EdgeInsets.only(left: 14,right: 14,top: 18,bottom: 18),
                        border: OutlineInputBorder(gapPadding: 2,borderRadius: BorderRadius.circular(30),borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black))
                    ),
                  ),
                ),
              ),
              FadeInRight(
                from: 150,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 20),
                  child: TextFormField(
                    controller: controller.pass.value,
                    validator: (value) {
                      if(value == null && value!.isEmpty){
                        return "enter email here";
                      }else{
                        return null;
                      }
                    },
                    obscureText: controller.isShow.value,
                    showCursor: true,
                    autocorrect: true,

                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: IconButton(icon:Icon(CupertinoIcons.eye_fill),onPressed: (){
                            setState(() {
                              controller.isShow.value = !controller.isShow.value;
                            });
                          }),
                        ),
                        fillColor: Colors.grey,
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.key),
                        hoverColor: Colors.white,
                        focusColor: Colors.blueGrey,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        contentPadding: EdgeInsets.only(left: 14,right: 14,top: 18,bottom: 18),
                        border: OutlineInputBorder(gapPadding: 2,borderRadius: BorderRadius.circular(30),borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black))
                    ),
                  ),
                ),
              ),
              FadeInRight(
                from: 200,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24,right: 24,top: 28),
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: double.infinity,
                      child: ElevatedButton(style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(33, 55, 80, 0.79)),
                      ),onPressed: (){
                        if(fromkey.currentState!.validate()){
                          controller.login(context);
                        }
                        controller.login(context);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen(),));
                      }, child: Text('Sign In',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),))),
                ),
              ),
              FadeInRight(
                from: 250,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot Password?',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 30),
                child: Container(
                  decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(width: 0.28))),
                ),
              ),
              FadeInUp(
                from: 150,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or sign in with',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),)
                    ],
                  ),
                ),
              ),
              FadeInUp(
                from: 100,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SignInButtonBuilder(
                      //   text: 'Sign in with Email',
                      //   icon: Icons.email,
                      //   onPressed: () {},
                      //   backgroundColor: Colors.blueGrey[700]!,
                      // )
                    ],
                  ),
                ),
              ),
              FadeInUp(
                from: 50,
                duration: Duration(milliseconds: 950),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do not have an account?',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                      SizedBox(width: 7,),
                      InkWell(
                        onTap: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                        },
                        child: Text('sign up',style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(33, 55, 80, 0.79)
                        ),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
