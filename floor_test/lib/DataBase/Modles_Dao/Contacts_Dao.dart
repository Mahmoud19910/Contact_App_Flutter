import 'package:floor/floor.dart';

import '../../Models/Contacts.dart';

@dao
abstract class Contacts_Dao{
  @Query('SELECT * FROM Contacts')
  Stream<List<Contacts>> getAllContact();

  @Query('SELECT * FROM Contacts WHERE id = :id')
  Future<Contacts?> getContactById(int id);

  @insert
  Future<void> insertContact(Contacts user);

  @delete
  Future<void> deleteContact(Contacts user);

  @Query('DELETE FROM Contacts WHERE id = :id')
  Future<void> eleteContactById(int id);
}