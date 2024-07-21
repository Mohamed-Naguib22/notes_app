import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(child: NotesListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) {
                return NoteBottomSheet();
              });
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
