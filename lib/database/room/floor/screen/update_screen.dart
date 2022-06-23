import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dao/note_dao.dart';
import '../table/note_table.dart';

class UpdateScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    title.text = note.title!;
    msg.text = note.msg!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
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
                    noteDao.updateNote(Note(title.text, msg.text, id: note.id));
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    'Update Note',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
