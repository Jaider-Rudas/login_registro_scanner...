import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rompe_filas/src/pages/info_producto.dart';

class QRProducto extends StatefulWidget {
  const QRProducto({
    Key? key,
    this.code,
  }) : super(key: key);
  final String? code;

  @override
  State<QRProducto> createState() => _QRProductoState();
}

class _QRProductoState extends State<QRProducto> {
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Escanear Código',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Usa la parte inferior de código de barra \n y del QR para encontrar el producto.',
                    style: TextStyle(
                      color: Color.fromARGB(235, 255, 255, 255),
                      fontSize: 16.5,
                      fontWeight: FontWeight.w900,
                    ),
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
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(207, 56, 56, 56),
                      // labelStyle: TextStyle(color: Colors.white),
                      hintText: 'O introduce el código',
                      hintStyle: TextStyle(color: Colors.white),
                      // prefixIcon: Icon(
                      //   Icons.code,
                      //   color: Color.fromARGB(255, 255, 255, 255),
                      // ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                    },
                  ),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14.0),
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
              builder: (context) => InformacionScreen(
                    code: result.code,
                    scannearUno: '',
                  )),
        );
      }
      controller.pauseCamera();
      controller.resumeCamera();
      setState(() {});
    });
  }
}
