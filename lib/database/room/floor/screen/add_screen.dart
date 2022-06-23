import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemapdemo/database/room/floor/dao/note_dao.dart';
import 'package:googlemapdemo/database/room/floor/table/note_table.dart';

class AddScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                  hintText: 'title', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: msg,
              decoration: const InputDecoration(
                  hintText: 'Message', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                    noteDao.addNote(Note(title.text, msg.text));
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    'Add Note',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
