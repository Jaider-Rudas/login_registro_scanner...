import 'package:flutter/material.dart';
import 'package:rompe_filas/src/pages/Scanner/tienda_scanner.dart';
import 'package:rompe_filas/src/pages/registro.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show GoogleAuthButton, AuthButtonStyle, AuthButtonType, AuthIconType;
import 'package:rompe_filas/utils/LoginGoogleUtils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
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
          child: ListView(
            children: [
              Expanded(
                flex: 10,
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
                        'Bienvenido a su increible aplicación para compras instantaneas.',
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
                    child: Form(
                      key: _keyForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                /*borderSide: BorderSide.none,*/
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 166, 184, 176),
                              hintText: 'Correo electrónico',
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo es obligatorio';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                /*borderSide: BorderSide.none,*/
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 166, 184, 176),
                              hintText: 'Contraseña',
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo Contraseña es obligatorio';
                              }
                            },
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
                                if (_keyForm.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const QRTiendas(
                                      valueDesplegable: '',
                                    ),
                                  ));
                                }
                              },
                              child: const Text(
                                "Entrar",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          /*loginProviders: [
                            LoginProvider(
                              button: Buttons.FacebookNew,
                              label: 'Iniciar sesión con Facebook',
                              callback: () async {
                                return Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const QRProducto(),
                                ));
                              },
                              providerNeedsSignUpCallback: () {
                                // put here your logic to conditionally show the additional fields
                                return Future.value(true);
                              },
                            ),
                            LoginProvider(
                              button: Buttons.Google,
                              label: 'Iniciar sesión con Google',
                              callback: () async {
                                return Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const QRProducto(),
                                ));
                              },
                              providerNeedsSignUpCallback: () {
                                // put here your logic to conditionally show the additional fields
                                return Future.value(true);
                              },
                            ),
                          ],*/
                          const SizedBox(height: 10),
                          FacebookAuthButton(
                            onPressed: () {},
                            style: const AuthButtonStyle(),
                          ),
                          const SizedBox(height: 10),
                          const GoogleAuthButton(
                            style: AuthButtonStyle(
                              buttonType: AuthButtonType.secondary,
                              iconType: AuthIconType.secondary,
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
                                  builder: (context) => const RegistroScreen(),
                                ));
                              },
                              child: const Text(
                                'Registrarse',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
