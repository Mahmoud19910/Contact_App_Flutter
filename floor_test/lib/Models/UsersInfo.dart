import 'package:floor/floor.dart';

@Entity()
class UsersInfo {
  @PrimaryKey(autoGenerate: true)
  int? id;
  late String name;
  late String pass;
  late String email;

  UsersInfo(this.name, this.pass , this.email);
}