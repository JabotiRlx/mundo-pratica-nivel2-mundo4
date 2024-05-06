import 'package:flutter/material.dart';
import 'destino.dart';
import 'viagem.dart';
import 'contatos.dart';
import 'sobre_nos.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Destino> destinos = [
    Destino(
      imageUrl: 'assets/images/lake.jpg',
      descricao: 'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos mais amplos. Um passeio de teleférico a partir de Kandersteg, seguido por meia hora de caminhada por pastagens e floresta de pinheiros, leva você ao lago, que aquece até 20 graus Celsius no verão. As atividades desfrutadas aqui incluem remo e andar no tobogã de verão.',
      rating: 4.5,
      pais:"Switzerland",
      nome:"Oeschinen Lake Campground",
      cidade:"Kandersteg"
    ),
    Destino(
      imageUrl: 'assets/images/ilha.jpg',
      descricao: 'Localizada em um arquipélago distante, o "Porto das Baleias Celestiais" é uma ilha paradisíaca de beleza incomparável. Com suas praias de areias brancas banhadas por águas cristalinas e cercadas por formações rochosas impressionantes, esta ilha é um verdadeiro tesouro escondido.',
      rating: 4.0,
      pais:"Brazil",
      nome:"Ilhas Lindas",
      cidade:"Portos das Baleias Celestiais"
    ),
    
  ];

  late String pesquisa;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    pesquisa = '';
    _controller = TextEditingController();
  }

  void _filtrarDestinos(String valor) {
    setState(() {
      pesquisa = valor;
    });
  }

  void _navigateToSobreNos( ) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutUsPage()),
    );
  }

  void _navigateToContato( ) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  ContactsPage()),
    );
  }

    void _navigateToviagem(Destino destinoSelecionado) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => viagem(destino: destinoSelecionado)),
    );
  }
  List<Destino> get destinosFiltrados {
    if (pesquisa.isEmpty) {
      return destinos;
    } else {
      return destinos.where((destino) {
        return destino.descricao.toLowerCase().contains(pesquisa.toLowerCase()) ||
            destino.rating.toString().contains(pesquisa) ||
            destino.pais.toLowerCase().contains(pesquisa.toLowerCase()) ||
            destino.nome.toLowerCase().contains(pesquisa.toLowerCase()) ||
            destino.cidade.toLowerCase().contains(pesquisa.toLowerCase())
            ;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Explore Mundo',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Pesquisar'),
                            content: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: 'Pesquisar',
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (valor) {
                                _filtrarDestinos(valor);
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _controller.clear();
                                  Navigator.pop(context);
                                },
                                child: Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _filtrarDestinos(_controller.text);
                                  Navigator.pop(context);
                                },
                                child: Text('Pesquisar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.search),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       _navigateToSobreNos();
                    },
                    child: Text('Sobre Nós'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToContato();
                    },
                    child: Text('Contato'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              destinosFiltrados.isEmpty
                  ? Center(
                      child: Text(
                        'Nada Encontrado!',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  : CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.width * 0.3, // Definindo a altura como metade da largura da tela,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                      items: destinosFiltrados.map((destination) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                _navigateToviagem(destination);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width, // Definindo a largura como a largura da tela
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
