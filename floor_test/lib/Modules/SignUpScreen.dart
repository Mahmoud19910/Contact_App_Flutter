import 'package:floor_test/Models/UsersInfo.dart';
import 'package:floor_test/Modules/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Getx_Managment/Controllers/sdata_controller.dart';

class SignUpScreen extends GetView<DataController> {
   SignUpScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final _formKey = GlobalKey<FormState>();


   final signUp_Controller=Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Input cannot be empty';
                    }
                    return null;

                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),


              SizedBox(height: 16),


              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Input cannot be empty';
                  }
                  return null;

                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Input cannot be empty';
                  }
                  return null;

                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {

                  if (_formKey.currentState!.validate()) {
                    signUp_Controller.addUser(nameController.text, emailController.text, passwordController.text);
                    printt();
                    Get.offAll(LoginScreen());
                  }

                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                    Get.offAll(LoginScreen());

                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void printt(){
    List<UsersInfo> list=signUp_Controller.users;
    for(UsersInfo user in list){
      print(user.email);
    }
  }
}
