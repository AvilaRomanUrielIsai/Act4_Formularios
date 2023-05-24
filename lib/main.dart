import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

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

class Formulario1 extends StatefulWidget {
  const Formulario1({super.key});

  @override
  Formulario1State createState() {
    return Formulario1State();
  }
}

extension Valor on String {
  bool get correoValido {
    final correo = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return correo.hasMatch(this);
  }

  bool get nombreValido {
    final nombre =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nombre.hasMatch(this);
  }

  bool get contraValida {
    final contra =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return contra.hasMatch(this);
  }
}

class Formulario1State extends State<Formulario1> {
  final _clave1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _clave1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.perm_identity),
                  border: OutlineInputBorder(),
                  labelText: 'Id_Cliente',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Nombre Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_2),
                  border: OutlineInputBorder(),
                  labelText: 'Apellido',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Apellido Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.correoValido) {
                    return 'Correo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                  labelText: 'Dirección',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.cast_for_education),
                  border: OutlineInputBorder(),
                  labelText: 'Código Postal',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.contraValida) {
                    return 'Contraseña Inválida';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_clave1.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Procesando Información')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class Formulario2 extends StatefulWidget {
  const Formulario2({super.key});

  @override
  Formulario2State createState() {
    return Formulario2State();
  }
}

class Formulario2State extends State<Formulario2> {
  final _clave2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _clave2,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.movie),
                  border: OutlineInputBorder(),
                  labelText: 'Id_Película',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: 'Título',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Título Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Director',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Nombre Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                  labelText: 'Año',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  border: OutlineInputBorder(),
                  labelText: 'Duración',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Text("Portada (Opcional)",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff747171))),
                    ElevatedButton(
                      child: const Text('Subir Archivo'),
                      onPressed: () async {
                        var picked = await FilePicker.platform.pickFiles();

                        if (picked != null) {
                          (picked.files.first.name);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.star),
                  border: OutlineInputBorder(),
                  labelText: 'Calificación',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_clave2.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Procesando Información')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class Formulario3 extends StatefulWidget {
  const Formulario3({super.key});

  @override
  Formulario3State createState() {
    return Formulario3State();
  }
}

class Formulario3State extends State<Formulario3> {
  final _clave3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _clave3,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.movie),
                  border: OutlineInputBorder(),
                  labelText: 'Id_Serie',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: 'Título',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Título Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Director',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  } else if (!valor.nombreValido) {
                    return 'Nombre Incorrecto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                  labelText: 'Años',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  border: OutlineInputBorder(),
                  labelText: 'Temporadas',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Text("Portada (Opcional)",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff747171))),
                    ElevatedButton(
                      child: const Text('Subir Archivo'),
                      onPressed: () async {
                        var picked = await FilePicker.platform.pickFiles();

                        if (picked != null) {
                          (picked.files.first.name);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.star),
                  border: OutlineInputBorder(),
                  labelText: 'Calificación',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_clave3.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Procesando Información')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class Formulario4 extends StatefulWidget {
  const Formulario4({super.key});

  @override
  Formulario4State createState() {
    return Formulario4State();
  }
}

class Formulario4State extends State<Formulario4> {
  final _clave4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _clave4,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.perm_identity),
                  border: OutlineInputBorder(),
                  labelText: 'Id_Cliente',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Número de tarjeta',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.date_range),
                  border: OutlineInputBorder(),
                  labelText: 'Fecha de Vencimiento',
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_num),
                  border: OutlineInputBorder(),
                  labelText: 'Numero de Cuenta (Empresa)',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.movie),
                  border: OutlineInputBorder(),
                  labelText: 'Id_Contenido',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.supervisor_account),
                  border: OutlineInputBorder(),
                  labelText: 'Número de Servicio',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo Inválido';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 46.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_clave4.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Procesando Información')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class _InicioState extends State<Inicio> {
  int _pagina = 0;

  static final List<Widget> _contenido = <Widget>[
    const Formulario1(),
    const Formulario2(),
    const Formulario3(),
    const Formulario4()
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
            icon: Icon(Icons.person),
            label: 'Clientes',
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
            icon: Icon(Icons.sell),
            label: 'Ventas',
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
