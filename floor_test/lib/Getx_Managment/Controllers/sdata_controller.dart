import 'package:floor_test/DataBase/Modles_Dao/Contacts_Dao.dart';
import 'package:floor_test/DataBase/Modles_Dao/UsersInfo_Dao.dart';
import 'package:floor_test/DataBase/app_data_base.dart';
import 'package:floor_test/Models/UsersInfo.dart';
import 'package:get/get.dart';

import '../../Models/Contacts.dart';

class DataController extends GetxController{

  late AppDataBase _database;
  late UsersInfo_Dao _usersInfoDao;
  final users = <UsersInfo>[].obs;
  late Contacts_Dao _contacts_dao;
  final contacts = <Contacts>[].obs;



  @override
  void onInit() {
    super.onInit();
    _initDatabase();
  }

  void _initDatabase() async {
    _database = await $FloorAppDataBase.databaseBuilder('app_database.db').build();
    _usersInfoDao = _database.usersInfo_Dao;
    _contacts_dao=_database.contact_Dao;
    _usersInfoDao.getAllUsers().listen((usersData) {
      users.value = usersData;
    });

    _contacts_dao.getAllContact().listen((usersData) {
      contacts.value = usersData;
    });
  }

  void addUser(String name, String pass  , String email) async {
    final user = UsersInfo(name, pass,email);
    await _usersInfoDao.insertUser(user);
  }

  void addContac(String name, String phone) async {
    final contact = Contacts(name, phone,null);
    await _contacts_dao.insertContact(contact);
  }

  void deleteContac(int id) async {
    await _contacts_dao.eleteContactById(id);
  }

  @override
  void onClose() {
    _database.close();
    super.onClose();
  }
}