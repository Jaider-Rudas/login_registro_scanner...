import 'package:flutter/material.dart';
import 'package:rompe_filas/src/pages/login.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _keyForm = GlobalKey<FormState>();

  bool _agree = false;
  bool _agreeDos = false;

  String documentoValue = 'Cédula de Ciudadanía';
  String paisValue = 'Colombia';
  String departamentoValue = 'Antioquía';
  String ciudadValue = 'Barranquilla';
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        title: const Text(
          'Registrarse',
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
                              hintText: 'Nombre',
                              prefixIcon: const Icon(
                                Icons.account_box_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo Nombre es obligatorio';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                              hintText: 'Apellido',
                              prefixIcon: const Icon(
                                Icons.account_box_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo Apellido es obligatorio';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                            height: 5.0,
                          ),
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
                              hintText: 'Contraseña',
                              prefixIcon: const Icon(
                                Icons.password_outlined,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo Contraseña es obligatorio';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                              hintText: 'Repetir Contraseña',
                              prefixIcon: const Icon(
                                Icons.password_outlined,
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
                            height: 5.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: documentoValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: 'Identificación',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.white70),
                              filled: true,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                documentoValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Cédula de Ciudadanía',
                              'Cédula de Extranjería',
                              'Tarjeta de Identidad'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                              hintText: 'Número de identificación',
                              prefixIcon: const Icon(
                                Icons.account_box_rounded,
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
                            height: 5.0,
                          ),
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
                              hintText: 'Dirección de residencia',
                              prefixIcon: const Icon(
                                Icons.add_location_sharp,
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
                            height: 5.0,
                          ),
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
                              hintText:
                                  'Más información                                                    opcional',
                              prefixIcon: const Icon(
                                Icons.mode_edit_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
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
                              hintText: 'Teléfono',
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El campo Teléfono es obligatorio';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: paisValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: 'País',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.white70),
                              filled: true,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                paisValue = newValue!;
                              });
                            },
                            items: <String>[
                              "Colombia",
                              "Guatemala",
                              "El Salvador",
                              "Honduras",
                              "Nicaragua",
                              "Costa Rica",
                              "Panamá",
                              "Ecuador",
                              "Perú",
                              "Bolivia",
                              "Chile",
                              "Argentina",
                              "Uruguay",
                              "Paraguay",
                              "Venezuela",
                              "Puerto Rico",
                              "República Dominicana",
                              "Cuba",
                              "Guinea Ecuatorial",
                              "España"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: departamentoValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: 'Departamento',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.white70),
                              filled: true,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                departamentoValue = newValue!;
                              });
                            },
                            items: <String>[
                              "Antioquía",
                              "Arauca",
                              "Atlántico",
                              "Bolívar",
                              "Boyacá",
                              "Caldas",
                              "Caquetá",
                              "Casanare",
                              "Cauca",
                              "Cesar",
                              "Chocó",
                              "Córdoba",
                              "Cundinamarca",
                              "Guainía",
                              "Guaviare",
                              "Huila",
                              "La Guajira",
                              "Magdalena",
                              "Meta",
                              "Nariño",
                              "Norte de Santander",
                              "Putumayo",
                              "Quindío",
                              "Risaralda",
                              "San Andrés y Providencia",
                              "Santander",
                              "Sucre",
                              "Tolima",
                              "Valle del Cauca",
                              "Vaupés",
                              "Vichada"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: ciudadValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: 'Ciudad',
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.white70),
                              filled: true,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                ciudadValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Barranquilla',
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
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                if (_keyForm.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                                }
                              },
                              child: const Text(
                                'Registrarse',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white54),
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
                                const Text('Quiero recibir '),
                                const InkWell(
                                  child: Text(
                                    'novedades y comunicaciones',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                    ' comerciales personalizadas de a través del email y otros medios '),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: _agreeDos,
                                    onChanged: (isChecked) {
                                      setState(() {
                                        _agreeDos = isChecked!;
                                      });
                                    }),
                                const Text('He podido '),
                                const Text(
                                    'leer y entiendo la información sobre el uso de mis datos personales explicada en la '),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Política de Privacidad.',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 80, 255),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 130),
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
