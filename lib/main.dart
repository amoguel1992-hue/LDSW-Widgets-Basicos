
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
      title: 'Filmoteca',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101018),
        useMaterial3: true,
      ),
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  final List<Map<String, dynamic>> peliculas = const [
    {'titulo': 'El Padrino', 'icono': Icons.movie, 'color': Color(0xFF713B32)},
    {'titulo': 'Interstellar', 'icono': Icons.rocket_launch, 'color': Color(0xFF254A70)},
    {'titulo': 'Parásitos', 'icono': Icons.masks, 'color': Color(0xFF45634D)},
    {'titulo': 'Toy Story', 'icono': Icons.toys, 'color': Color(0xFF966A31)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ENCABEZADO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FILMOTECA',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Color(0xFFE7B75B),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.help_outline),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // BUSCADOR
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF252531),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.white70),
                          SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Buscar películas...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // PELÍCULA DESTACADA
                    const Text(
                      'PELÍCULA DESTACADA',
                      style: TextStyle(
                        color: Color(0xFFE7B75B),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        height: 210,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF182A43),
                                    Color(0xFF65452D),
                                    Color(0xFF171721),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 25,
                              top: 30,
                              child: Icon(
                                Icons.landscape,
                                size: 110,
                                color: Colors.white24,
                              ),
                            ),
                            Positioned(
                              left: 18,
                              bottom: 18,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'DUNE: PARTE DOS',
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Una aventura más allá del desierto',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text('Ver ahora'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE7B75B),
                                      foregroundColor: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // CATÁLOGO DE PELÍCULAS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Películas populares',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Ver todas'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: peliculas.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final pelicula = peliculas[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF252531),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: pelicula['color'],
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    pelicula['icono'],
                                    size: 55,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  pelicula['titulo'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // MENÚ INFERIOR
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF20202B),
                border: Border(
                  top: BorderSide(color: Colors.white12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MenuItem(icono: Icons.home, texto: 'Inicio', activo: true),
                  _MenuItem(icono: Icons.search, texto: 'Buscar'),
                  _MenuItem(icono: Icons.favorite, texto: 'Favoritos'),
                  _MenuItem(icono: Icons.person, texto: 'Perfil'),
                ],
              ),
            ),
          ],
        ),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icono,
          color: activo ? const Color(0xFFE7B75B) : Colors.white60,
        ),
        const SizedBox(height: 4),
        Text(
          texto,
          style: TextStyle(
            fontSize: 12,
            color: activo ? const Color(0xFFE7B75B) : Colors.white60,
          ),
        ),
      ],
    );
  }
}
