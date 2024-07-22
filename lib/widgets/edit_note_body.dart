import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';
import 'package:notes_app/cubits/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          icon: Icons.check,
          title: "Edit Note",
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.content = content ?? widget.note.content;
            widget.note.save();

            BlocProvider.of<GetNoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              CustomTextField(
                hint: widget.note.title,
                maxLines: 1,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                hint: widget.note.content,
                maxLines: 5,
                onChanged: (value) {
                  content = value;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColorsList[index].value;
                setState(() {});
              },
              child: ColorItem(
                  color: kColorsList[index], isActive: currentIndex == index),
            ),
          );
        },
      ),
    );
  }
}
