import 'package:floor/floor.dart';
import 'package:floor_test/Models/UsersInfo.dart';

@dao
abstract class UsersInfo_Dao{

  // @Insert(onConflict: OnConflictStrategy.replace)
  // Future<int> insertUser(UsersInfo user);
  //
  // @delete
  // Future<void> deleteUsers(UsersInfo usersInfo);
  //
  // @Query("SELECT * FROM UsersInfo")
  // Future<List<UsersInfo>> getAllUsers();

  @Query('SELECT * FROM UsersInfo')
  Stream<List<UsersInfo>> getAllUsers();

  @Query('SELECT * FROM UsersInfo WHERE id = :id')
  Future<UsersInfo?> getUserById(int id);

  @insert
  Future<void> insertUser(UsersInfo user);

  @delete
  Future<void> deleteUser(UsersInfo user);
}
