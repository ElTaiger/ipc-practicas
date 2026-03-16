import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppRockstar());
}

class JuegoRockstar {
  final String titulo;
  final String descripcion;
  
  // Como la imagen se llama igual que el título, ya no necesitamos la variable rutaImagen
  JuegoRockstar(this.titulo, this.descripcion);
}

class MiAppRockstar extends StatelessWidget {
  const MiAppRockstar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica 2 - Rockstar',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 2,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E1E1E), 
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      home: const PantallaListaJuegos(),
    );
  }
}

class PantallaListaJuegos extends StatefulWidget {
  const PantallaListaJuegos({super.key});

  @override
  State<PantallaListaJuegos> createState() => _PantallaListaJuegosState();
}

class _PantallaListaJuegosState extends State<PantallaListaJuegos> {
  
  // Lista de juegos. Solo ponemos título y descripción.
  final List<JuegoRockstar> misJuegos = [
    JuegoRockstar('Grand Theft Auto', '1997/1998 - El inicio de todo en 2D.'),
    JuegoRockstar('Midnight Club - Street Racing', 'Octubre 2000 - Carreras callejeras.'),
    JuegoRockstar('Max Payne', 'Julio 2001 - El rey del Bullet Time.'),
    JuegoRockstar('Grand Theft Auto III', 'Octubre 2001 - El salto al 3D.'),
    JuegoRockstar('Grand Theft Auto - Vice City', 'Octubre 2002 - Clásico de los 80.'),
    JuegoRockstar('Red Dead Revolver', 'Mayo 2004 - Inicio del Salvaje Oeste.'),
    JuegoRockstar('Grand Theft Auto - San Andreas', 'Octubre 2004 - Un mundo inmenso.'),
    JuegoRockstar('Bully', 'Octubre 2006 - Aventuras en el instituto.'),
    JuegoRockstar('Grand Theft Auto IV', 'Abril 2008 - Alta definición.'),
    JuegoRockstar('Red Dead Redemption', 'Mayo 2010 - La madurez de la saga.'),
    JuegoRockstar('L.A. Noire', 'Mayo 2011 - Investigación policial.'),
    JuegoRockstar('Max Payne 3', 'Mayo 2012 - La última entrega de Max.'),
    JuegoRockstar('Grand Theft Auto V', 'Septiembre 2013 - El hito de ventas.'),
    JuegoRockstar('Red Dead Redemption 2', 'Octubre 2018 - Arthur Morgan.'),
    JuegoRockstar('Grand Theft Auto VI', 'Nov. 2026 - Regreso a Vice City.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia de Rockstar Games'),
      ),
      body: ListView.builder(
        itemCount: misJuegos.length,
        itemBuilder: (context, index) {
          final juego = misJuegos[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              
              // ==========================================
              // MAGIA AQUÍ: Busca la imagen concatenando el título
              // ==========================================
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/${juego.titulo}.jpg', // Usa el título exacto para buscar el .jpg
                  width: 50,
                  height: 70,
                  fit: BoxFit.cover, 
                  // Si te equivocas en una letra del nombre del archivo, saldrá un icono gris
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.videogame_asset, size: 50, color: Colors.grey);
                  },
                ),
              ),
              title: Text(
                juego.titulo, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
              subtitle: Text(
                juego.descripcion,
                style: const TextStyle(color: Colors.white70),
              ),
              
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'La visualización detallada se desarrollará en la Fase 3',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.orange,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}