import 'package:floor/floor.dart';

@Entity()
class Contacts{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  late String name;
  late String phone;

  Contacts(this.name , this.phone, this.id);

}