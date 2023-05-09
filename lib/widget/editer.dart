import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  const Editor(int index, {super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            setState(() {
              _textController.notifyListeners();
            });
          },
          child: const Text("Send Message"),
        ),
      ],
    );
  }
}
