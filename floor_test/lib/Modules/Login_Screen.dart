import 'package:floor_test/Models/UsersInfo.dart';
import 'package:floor_test/Modules/HomeScreen.dart';
import 'package:floor_test/Modules/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Getx_Managment/Controllers/sdata_controller.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   final signUp_Controller=Get.put(DataController());
   final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool checkData=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          Get.offAll(SignUpScreen());
          return Future.value(false);

        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // TODO: Implement forgot password functionality

                      },
                      child: Text('Forgot password?'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement login functionality
                          getAllUsers();
                          if(checkData == true){
                            Get.offAll(Home());
                          }else{
                            Fluttertoast.showToast(
                              msg: 'Failed sign in',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getAllUsers(){
    List<UsersInfo> list =signUp_Controller.users;

    for(UsersInfo users in list){
      print(users.email);
      if(users.email == _emailController.text && users.pass == _passwordController.text){
        checkData=true;
      }
    }
  }
}
