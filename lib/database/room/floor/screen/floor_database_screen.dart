import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlemapdemo/database/room/floor/controller/floor_controller.dart';
import 'package:googlemapdemo/database/room/floor/dao/note_dao.dart';
import 'package:googlemapdemo/database/room/floor/screen/add_screen.dart';
import 'package:googlemapdemo/database/room/floor/screen/update_screen.dart';

import '../table/note_table.dart';

class FloorDatabase extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  List<Note> notes = [];
  FloorDBController floorDBController = Get.put(FloorDBController());
  FloorDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Database'),
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              // await noteDao?.addNote(Note('Android', 'Operating system'));
              Get.to(AddScreen());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () {
              noteDao.deleteAllNotes(notes);
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
        stream: noteDao.getAllNotes(),
        builder: (context, data) {
          if (data.hasData) {
            notes = data.data!;
            if (data.data!.isEmpty) {
              return const Center(
                  child: Text(
                'No Records',
                style: TextStyle(fontSize: 30),
              ));
            } else {
              return ListView.builder(
                  itemCount: data.data!.length,
                  itemBuilder: (context, position) {
                    return Card(
                      child: ListTile(
                        title: Text(data.data![position].title.toString()),
                        subtitle: Text(data.data![position].msg.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            noteDao.deleteNote(data.data![position]);
                          },
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Get.to(UpdateScreen(),
                                arguments: data.data![position]);
                          },
                        ),
                      ),
                    );
                  });
            }
          } else if (data.hasError) {
            return const Text('Error');
          } else {
            return const Text('Loading..');
          }
        });
  }
}
