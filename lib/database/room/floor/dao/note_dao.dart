import 'package:floor/floor.dart';

import '../table/note_table.dart';

@dao
abstract class NoteDao {
  @Query('select * from note')
  Stream<List<Note>> getAllNotes();
  @insert
  Future<void> addNote(Note note);
  @delete
  Future<void> deleteNote(Note note);
  @update
  Future<void> updateNote(Note note);
  @delete
  Future<void> deleteAllNotes(List<Note> notes);
  // @Query('SELECT * FROM note')
  // Future<List<Note>> retrieveNotes();
}
