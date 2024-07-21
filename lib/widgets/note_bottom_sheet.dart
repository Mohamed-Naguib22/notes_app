import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: 'Text',
              maxLines: 1,
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: 'Content',
              maxLines: 3,
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton(),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
