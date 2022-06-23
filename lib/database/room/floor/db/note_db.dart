import 'dart:async';

import 'package:floor/floor.dart';
import 'package:googlemapdemo/database/room/floor/dao/note_dao.dart';

import '../table/note_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
part 'note_db.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
