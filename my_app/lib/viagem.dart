import 'package:flutter/material.dart';
import 'destino.dart';

class viagem extends StatelessWidget {
  final Destino destino;
  const viagem({Key? key, required this.destino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definindo as cores e estilo dos botões
    Color color = Theme.of(context).primaryColor;

    // Construção da coluna da seção de título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:  Text(
                    destino.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  destino.cidade  + ', ' + destino.pais,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
           Text( destino.rating.toString() ),
        ],
      ),
    );

    // Método auxiliar para construir colunas de botões
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // Construção da seção de botões
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Construção da seção de texto
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child:  Text(
        destino.descricao,
        softWrap: true,
      ),
    );

    // Organizando os elementos em uma ListView
    return MaterialApp(
      title: '',
      home: Scaffold(
        appBar: AppBar(
    
        ),
        body: ListView(
          children: [
            Image.asset(
              destino.imageUrl,
              width:  MediaQuery.of(context).size.width * 0.2, // Definindo a largura como a largura da tela,
              height: MediaQuery.of(context).size.width * 0.2,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:  Text( destino.description ),
  //     ),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         child: const Text('Go Back222'),
  //       ),
  //     ),
  //   );
  // }
}