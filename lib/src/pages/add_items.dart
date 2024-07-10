import 'package:flutter/material.dart';

class AddItens extends StatefulWidget {
  const AddItens({super.key});

  @override
  State<AddItens> createState() => _AddItensState();
}

class _AddItensState extends State<AddItens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Adicione aqui',
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            TextAreaExample()
          ],
        ),
      ),
    );
  }
}

class TextAreaExample extends StatefulWidget {
  @override
  _TextAreaExampleState createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            maxLines: null, // Permite várias linhas
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Digite seu texto aqui...',
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
