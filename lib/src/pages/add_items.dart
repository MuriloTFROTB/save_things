import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item {
  String nome;
  String descricao;

  Item({required this.nome, required this.descricao});
}

class AddItens extends StatefulWidget {
  const AddItens({super.key});

  @override
  State<AddItens> createState() => _AddItensState();
}

class _AddItensState extends State<AddItens> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _imageLinkController = TextEditingController();
  List<Item> itens = [];
  String? imageUrl;

  void _showMessage(BuildContext context) {
    final snackBar = SnackBar(content: Text('Adicionado'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showImageLinkDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Insira o link da imagem'),
            content: TextField(
              controller: _imageLinkController,
              decoration: InputDecoration(hintText: 'Link da Imagem'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    imageUrl = _imageLinkController.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _showImageLinkDialog(context),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF6E6C6C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: imageUrl == null
                          ? Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 36, 35, 35),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 50,
                              ),
                            )
                          : Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nome',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _nomeController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextAreaExample(controller: _descricaoController),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Salvar o item
                      String nome = _nomeController.text;
                      String descricao = _descricaoController.text;
                      Item novoItem = Item(nome: nome, descricao: descricao);
                      _showMessage(context);
                      setState(() {
                        itens.add(novoItem);
                      });
                      // Limpar os campos após salvar
                      _nomeController.clear();
                      _descricaoController.clear();
                    },
                    child: Text('Salvar'),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Cancelar a adição de item (limpar os campos)
                      _nomeController.clear();
                      _descricaoController.clear();
                    },
                    child: Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextAreaExample extends StatefulWidget {
  final TextEditingController controller;

  const TextAreaExample({required this.controller});

  @override
  _TextAreaExampleState createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 140,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.multiline,
            maxLines: null, // Permite várias linhas
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Digite sua descrição aqui...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}
