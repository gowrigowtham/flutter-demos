import 'package:floor/floor.dart';

@Entity(tableName: 'note')
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: 'title')
  String? title;
  String? msg;
  Note(this.title, this.msg, {this.id});
}
