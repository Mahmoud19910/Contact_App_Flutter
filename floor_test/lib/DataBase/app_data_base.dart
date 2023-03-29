import 'package:floor/floor.dart';
import 'package:floor_test/DataBase/Modles_Dao/Contacts_Dao.dart';
import 'package:floor_test/DataBase/Modles_Dao/UsersInfo_Dao.dart';
import '../Models/Contacts.dart';
import '../Models/UsersInfo.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_data_base.g.dart'; // the generated code will be there

@Database(version: 3, entities: [UsersInfo , Contacts ])
abstract class AppDataBase extends FloorDatabase{
UsersInfo_Dao get usersInfo_Dao;
Contacts_Dao get contact_Dao;


}