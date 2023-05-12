import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzdoc/cubit/line_cubit.dart';

import '../models/line.dart';

class EditorView extends StatefulWidget {
  const EditorView({super.key});

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  TextEditingController _textController = TextEditingController();
  // Line line = Line.empty;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineCubit, LineState>(
      builder: (context, state) {
        _textController = TextEditingController(text: state.line.rawText);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _textController,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Enter A Message Here',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // if (line.index < 0) {
                //   return;
                // }
                final newLine =
                    state.line.copyWith(rawText: _textController.text);

                context.read<LineCubit>().selectNext(newLine);
              },
              child: const Text("Send Message"),
            ),
          ],
        );
      },
    );
  }
}
