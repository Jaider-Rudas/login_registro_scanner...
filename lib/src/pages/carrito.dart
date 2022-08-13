import 'package:flutter/material.dart';
import 'package:rompe_filas/src/pages/pagar.dart';
import 'Scanner/producto_scanner.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({Key? key, required this.scannearDos}) : super(key: key);
  final String scannearDos;
  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        title: const Text(
          'Regresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(207, 106, 106, 93),
                Color.fromARGB(207, 0, 0, 0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'ROMPE \n FILAS',
                        style: TextStyle(
                          color: Color.fromARGB(171, 151, 251, 236),
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Bienvenido, ingrese a pagar su producto o vuela a escanear algun nuevo producto.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color.fromRGBO(255, 255, 255, 0.703),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PagarScreen(
                                  scannearTres: '',
                                ),
                              ));
                            },
                            child: const Text(
                              "Pagar",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QRProducto(
                                  code: widget.scannearDos,
                                ),
                              ));
                            },
                            child: const Text(
                              'Escanear de nuevo',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: Color.fromARGB(198, 172, 235, 227),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'BUSCAR',
            backgroundColor: Color.fromARGB(198, 172, 235, 227),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'MENÚ',
            backgroundColor: Color.fromARGB(198, 172, 235, 227),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_rounded),
            label: 'CESTA DE COMPRAR',
            backgroundColor: Color.fromARGB(198, 172, 235, 227),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'MI CUENTA',
            backgroundColor: Color.fromARGB(198, 172, 235, 227),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
