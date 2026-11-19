
import 'package:flutter/material.dart';

void main() {
  runApp(const FilmotecaApp());
}

class FilmotecaApp extends StatelessWidget {
  const FilmotecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FILMOTECA',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> peliculas = const [
    {'titulo': 'El Padrino', 'icono': Icons.movie},
    {'titulo': 'Interstellar', 'icono': Icons.rocket_launch},
    {'titulo': 'Parásitos', 'icono': Icons.theater_comedy},
    {'titulo': 'Toy Story', 'icono': Icons.toys},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen de fondo y bienvenida
              SizedBox(
                height: 260,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/fondo.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withValues(alpha: 0.60),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FILMOTECA',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFC857),
                              letterSpacing: 3,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '¡Bienvenido a FILMOTECA!',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Descubre películas y disfruta del cine.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Buscador
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar películas...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Película destacada
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'PELÍCULA DESTACADA',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF292929),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.movie_creation,
                      size: 45,
                      color: Color(0xFFFFC857),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'DUNE: PARTE DOS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Una aventura cinematográfica que no te puedes perder.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              // Películas populares
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'PELÍCULAS POPULARES',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: peliculas.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF292929),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            peliculas[index]['icono'],
                            size: 35,
                            color: const Color(0xFFFFC857),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            peliculas[index]['titulo'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Menú inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1C1C),
        selectedItemColor: const Color(0xFFFFC857),
        unselectedItemColor: Colors.white54,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}


class _MenuItem extends StatelessWidget {
  final IconData icono;
  final String texto;
  final bool activo;

  const _MenuItem({
    required this.icono,
    required this.texto,
    this.activo = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = activo
        ? const Color(0xFFE7B75B)
        : Colors.white60;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icono,
          color: color,
          size: 25,
        ),
        const SizedBox(height: 5),
        Text(
          texto,
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
