import 'package:flutter/material.dart';
import 'package:rompe_filas/src/pages/carrito.dart';
import 'Scanner/producto_scanner.dart';

int cantidad = 1;

class InformacionScreen extends StatefulWidget {
  const InformacionScreen({Key? key, required this.scannearUno, this.code})
      : super(key: key);
  final String scannearUno;
  final String? code;

  @override
  State<InformacionScreen> createState() => _InformacionScreenState();
}

class _InformacionScreenState extends State<InformacionScreen> {
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
          child: ListView(
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
                        'Bienvenido, añade su producto al carrito o vuelva a escanear de nuevo.',
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
              Align(
                alignment: const Alignment(-0.5, -0.5),
                child: Card(
                  color: const Color.fromARGB(190, 165, 225, 217),
                  child: Text(
                    widget.code!,
                    style: const TextStyle(color: Colors.black),
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
                        const SizedBox(height: 170),
                        const Align(
                          alignment: Alignment(-1, 0),
                          child: Card(
                            color: Color.fromARGB(171, 151, 251, 236),
                            child: QuantitySelection(),
                          ),
                        ),
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
                                builder: (context) => const CarritoScreen(
                                  scannearDos: '',
                                ),
                              ));
                            },
                            child: const Text(
                              "Añadir al carrito",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
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
                                  code: widget.scannearUno,
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

class QuantitySelection extends StatefulWidget {
  const QuantitySelection({Key? key}) : super(key: key);

  @override
  _QuantitySelectionState createState() => _QuantitySelectionState();
}

class _QuantitySelectionState extends State<QuantitySelection> {
  final double width;
  final double height;

  _QuantitySelectionState({
    this.width = 150.0,
    this.height = 42.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(3),
      ),
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  cantidad--;
                  if (cantidad < 1) {
                    cantidad = 1;
                  }
                  print(cantidad);
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  cantidad.toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  cantidad++;
                  print(cantidad);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
