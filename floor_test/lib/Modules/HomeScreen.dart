import 'package:floor_test/DataBase/app_data_base.dart';
import 'package:floor_test/Models/UsersInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Getx_Managment/Controllers/sdata_controller.dart';

class Home extends GetView<DataController>{
  final _contactController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Obx(() =>ListView.separated(
              itemBuilder: (context , index)=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Name : ${_contactController.contacts[index].name}"),
                  Row(
                    children: [

                      Text("Phone Number  : ${_contactController.contacts[index].phone}"),
                      InkWell(
                        onTap: (){
                          _contactController.deleteContac(_contactController.contacts[index].id!);
                          print("${_contactController.contacts[index].id}");
                        },
                          child: Icon(Icons.delete , color: Colors.red,))
                    ],
                  )
                ],),
              ),
              separatorBuilder: (context , index)=> SizedBox(height: 2,),
              itemCount: _contactController.contacts.length)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // _usersController.addUser(nameController.text, passController.text);
              _contactController.addContac(nameController.text, phoneController.text);
              print(nameController.text.toString());
              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}