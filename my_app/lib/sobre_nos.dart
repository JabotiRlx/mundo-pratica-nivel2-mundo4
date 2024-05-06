import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nós'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sobre Nossa Empresa:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Somos uma agência de viagens especializada em proporcionar experiências inesquecíveis '
              'para nossos clientes. Com mais de 10 anos de experiência, oferecemos pacotes de viagem '
              'personalizados para destinos nacionais e internacionais. Nossa missão é tornar cada viagem '
              'uma aventura única e memorável.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}