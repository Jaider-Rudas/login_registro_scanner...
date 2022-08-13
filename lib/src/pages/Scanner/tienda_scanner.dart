import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rompe_filas/src/pages/Scanner/producto_scanner.dart';

class QRTiendas extends StatefulWidget {
  const QRTiendas({
    Key? key,
    required this.valueDesplegable,
  }) : super(key: key);
  final String valueDesplegable;

  @override
  State<QRTiendas> createState() => _QRTiendasState();
}

class _QRTiendasState extends State<QRTiendas> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Barcode? result;
  String ciudadesValue = 'Barranquilla';
  String superMercados = "Buenavista";
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        title: const Text(
          'Regresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(207, 0, 0, 0),
                Color.fromARGB(207, 0, 0, 0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topLeft,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'ESCANEAR TIENDAS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 41.4,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor:
                              const Color.fromARGB(255, 105, 45, 218),
                        ),
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getCameraInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return const Text(
                                'Cámara Trasera',
                                style: TextStyle(color: Colors.white),
                              );
                            } else {
                              return const Text(
                                'Activar Cámara',
                                style: TextStyle(color: Colors.yellow),
                              );
                            }
                          },
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: (controller) =>
                          onQRViewCreated(controller, context),
                      overlay: QrScannerOverlayShape(
                        borderColor: Theme.of(context).primaryColor,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: scanArea,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DropdownButtonFormField<String>(
                    value: ciudadesValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    decoration: InputDecoration(
                      labelText: 'Ciudad',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.blue
                              : Colors.white),
                      filled: true,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        ciudadesValue = newValue!;
                      });
                    },
                    items: <String>[
                      "Barranquilla",
                      'Medellín',
                      'Arauca',
                      'Cartagena de Indias',
                      'Tunja',
                      'Manizales',
                      'Florencia',
                      'Yopal',
                      'Popayán',
                      'Valledupar',
                      'Quibdó',
                      'Montería',
                      'Bogotá',
                      'Inírida',
                      'Neiva',
                      'Riohacha',
                      'Santa Marta',
                      'Villavicencio',
                      'Mocoa',
                      'Armenia',
                      'Pereira',
                      'San Andrés',
                      'Bucaramanga',
                      'Sincelejo',
                      'Ibagué',
                      'Cali',
                      'Mitú',
                      'Puerto Carreño'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonFormField<String>(
                    value: superMercados,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    decoration: InputDecoration(
                      labelText: 'Tienda',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.blue
                              : Colors.white),
                      filled: true,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        superMercados = newValue!;
                      });
                    },
                    items: <String>[
                      'Buenavista',
                      'Almacenes Éxito',
                      'Supertiendas Olímpica (y su filial Supertiendas Cañaveral)',
                      'Cencosud Colombia (Jumbo), Alkosto',
                      'Home Center',
                      'Almacenes La 14',
                      'Falabella de Colombia',
                      'Super Inter Supermercados',
                      'Pricesmart de Colombia',
                      'Pepe Ganga',
                      'Supermercado Euro',
                      'Consumo, Megatiendas',
                      'Supermercados Cundinamarca',
                      'El Arrozal, Mercamío',
                      'Supermercados El Rendidor',
                      'Supermercados Más por Menos',
                      'Autoservicio Paraíso',
                      'Supermercados Merca Z',
                      'Mercados y Carnes OR',
                      'Supermarket Solutions',
                      'Autoservicio El Perdomo',
                      'Oxxo Colombia',
                      'Makro Súper Mayorista',
                      'Almacenes Flamingo',
                      'Mercado Zapatoca',
                      'Almacenes YEP',
                      'Mercatodo, Home Sentry',
                      'Mercamas, Cooratiendas',
                      'Empresas La Polar',
                      'Surtifamiliar',
                      'Mercaldas',
                      'Supermercado Belalcazar',
                      'Surtifruver Sabana',
                      'Supermercado La Gran Colombia',
                      'Rapimercar',
                      'Supermercados Caribe',
                      'La Casa de los Tenderos',
                      'Supermercado El Viejo París',
                      'Ripley Colombia',
                      'Supermercados Mercar',
                      'Districol TAT',
                      'Supermercado El Rebajón',
                      'Jerónimo Martins Colombia',
                      'Supermercado Libertad',
                      'Ventanilla Verde Autoservicio',
                      'Metro Supermercado',
                      'Mercapava',
                      'Mercados Romi',
                      'Mercacentro',
                      'SupermercadoBoom'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QRProducto(
                            code: widget.valueDesplegable,
                          ),
                        ));
                        // Align(
                        //   alignment: const Alignment(1, 0),
                        //   child: Center(
                        //     child: QRTiendas(
                        //         valueDesplegable:
                        //             "$ciudadesValue \n $superMercados", resultQR: '',),
                        //   ),
                        // );
                      },
                      child: const Text("ESCANEAR"),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: Color.fromARGB(188, 0, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'BUSCAR',
            backgroundColor: Color.fromARGB(188, 0, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'MENÚ',
            backgroundColor: Color.fromARGB(188, 0, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_rounded),
            label: 'CESTA DE COMPRAR',
            backgroundColor: Color.fromARGB(188, 0, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'MI CUENTA',
            backgroundColor: Color.fromARGB(188, 0, 0, 0),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  get scanArea => (MediaQuery.of(context).size.width < 400 ||
          MediaQuery.of(context).size.height < 400)
      ? 150.0
      : 320.0;
  void onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final Barcode result = scanData;
      if (result.code != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QRProducto(code: result.code)),
        );
      }
      controller.pauseCamera();
      controller.resumeCamera();
      setState(() {});
    });
  }
}
