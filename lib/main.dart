import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const Diseno());

class Diseno extends StatelessWidget {
  const Diseno({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _pagina = 0;
  static final List<Widget> _contenido = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Uriel Isaí Ávila Román",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: const Color(0x48fffba8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
        ),
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/20230509_144403.jpg"),
        ),
        Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: const [
                Text(
                  "6-I",
                  style: TextStyle(
                    fontSize: 26,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Especialidad: Programación",
                  style: TextStyle(
                    fontSize: 26,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ])),
          decoration: BoxDecoration(
            color: const Color(0x48ece44a),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
        ), //Especialidad y grupo
      ],
    ),
    const Text(
      'Página en mantenimiento',
    ),
    const Text(
      'Página en mantenimiento',
    ),
    const Text(
      'Página en mantenimiento',
    ),
  ];

  void _presionado(int index) {
    setState(() {
      _pagina = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc3e5ff),
      appBar: AppBar(
        title: const Text('Blockbuster',
            style: TextStyle(color: Color(0xfff6d412))),
        centerTitle: true,
        backgroundColor: const Color(0xff0f6cf8),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Color(0xfff9fd16)),
          tooltip: 'Inicio',
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/drawer.jpeg"), fit: BoxFit.cover),
              ),
              accountName: Text(
                "Uriel Ávila",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Blockbuster_admin@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/20230509_144403.jpg")),
            ),
          ],
        ),
      ),
      body: Center(
        child: _contenido.elementAt(_pagina),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Color(0xff0f6cf8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Peliculas',
            backgroundColor: Color(0xff0f6cf8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Series',
            backgroundColor: Color(0xff0f6cf8),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
            backgroundColor: Color(0xff0f6cf8),
          ),
        ],
        currentIndex: _pagina,
        selectedItemColor: const Color(0xffffee00),
        onTap: _presionado,
      ),
    );
  }
}
