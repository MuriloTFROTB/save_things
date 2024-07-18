import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item {
  String nome;
  String descricao;
  String capaUrl;

  Item({required this.nome, required this.descricao, required this.capaUrl});
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

  void _updateImage() {
    setState(() {
      imageUrl = _imageLinkController.text.isNotEmpty
          ? _imageLinkController.text
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Link da Capa',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _imageLinkController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onChanged: (value) => _updateImage(),
                    ),
                  ],
                ),
                imageUrl != null
                    ? Container(
                        margin: EdgeInsets.only(top: 16),
                        height: 240,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'Erro ao carregar a imagem',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          String capaUrl = _imageLinkController.text;
                          Item novoItem = Item(
                            nome: nome,
                            descricao: descricao,
                            capaUrl: capaUrl,
                          );
                          _showMessage(context);
                          setState(() {
                            itens.add(novoItem);
                          });
                          // Limpar os campos após salvar
                          _nomeController.clear();
                          _descricaoController.clear();
                          _imageLinkController.clear();
                          _updateImage(); // Atualizar a imagem
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
                          _imageLinkController.clear();
                          _updateImage(); // Atualizar a imagem
                        },
                        child: Text('Limpar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
