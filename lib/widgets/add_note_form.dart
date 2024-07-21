import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Text',
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 3,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: (){
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                var noteModel = NoteModel(title: title!, content: content!, date: DateTime.now().toString(), color: Colors.blue.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              }
              else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
              }              
            },
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}