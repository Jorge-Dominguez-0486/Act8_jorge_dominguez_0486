import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Widget para construir cada tarjeta con icono, texto y gradiente
  Widget _buildCard(String texto, IconData icono, List<Color> colors) {
    return Expanded(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icono, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir una fila de dos tarjetas
  Widget _buildFilaCards(String texto1, IconData icono1, List<Color> colors1, String texto2, IconData icono2, List<Color> colors2) {
    return Expanded(
      child: Row(
        children: [
          _buildCard(texto1, icono1, colors1),
          const SizedBox(width: 15),
          _buildCard(texto2, icono2, colors2),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Librería",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        actions: const [
          Icon(Icons.book, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.money_sharp, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Stack(
        children: [
          // Fondo degradado para toda la pantalla
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red[100]!, Colors.blue[100]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Contenido principal de la app
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Fila 1: Naranja a Amarillo
                  _buildFilaCards(
                    "Catálogo", Icons.book, const [Color(0xFFF2994A), Color(0xFFF2C94C)],
                    "Novedades", Icons.new_releases, const [Color(0xFF56CCF2), Color(0xFF2F80ED)],
                  ),
                  const SizedBox(height: 15),
                  // Fila 2: Magenta a Verde
                  _buildFilaCards(
                    "Autores", Icons.person, const [Color(0xFFEB5757), Color(0xFFE53935)],
                    "Editoriales", Icons.business, const [Color(0xFF27AE60), Color(0xFF219653)],
                  ),
                  const SizedBox(height: 15),
                  // Fila 3: Azul a Guinda
                  _buildFilaCards(
                    "Ofertas", Icons.local_offer, const [Color(0xFF2193B0), Color(0xFF6DD5ED)],
                    "Premium", Icons.star, const [Color(0xFF800000), Color(0xFFA52A2A)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
