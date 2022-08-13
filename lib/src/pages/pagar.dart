import 'package:flutter/material.dart';
import 'Scanner/producto_scanner.dart';

class PagarScreen extends StatefulWidget {
  const PagarScreen({Key? key, required this.scannearTres}) : super(key: key);
  final String scannearTres;
  @override
  State<PagarScreen> createState() => _PagarScreenState();
}

class _PagarScreenState extends State<PagarScreen> {
  int _selectedIndex = 0;
  bool _agree = false;

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
                      vertical: 56.0, horizontal: 24.0),
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
                        '¡Hola! seleccione tú método de pago y muchas gracias por su compra online "vuelva pronto" adíos.',
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
              const SizedBox(height: 10),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 20, color: Colors.white54),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _agree,
                      onChanged: (isChecked) {
                        setState(
                          () {
                            _agree = isChecked!;
                          },
                        );
                      },
                    ),
                    const Text('He leído y acepto los '),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        ' Términos y condiciones',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(' & '),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        ' autorizo el tratamiento ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(' de mis datos personales según la '),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        ' Política de Protección de Datos.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
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
                                  code: widget.scannearTres,
                                ),
                              ));
                            },
                            child: const Text(
                              'Volver',
                              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
