import 'dart:developer';

import '../datasource/local/local.dart';
import '../datasource/remote/remote.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remote;
  final Storage _local;
  AuthRepositoryImpl(this._remote, this._local);

  get basepath => null;

  @override
  Future<int?> login(String email, String password) async {
    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    final response = await _remote.post("$basepath/login", body);
    if (response != null) {
      _local.writeStorage("AUTH_TOKEN", response["access_token"]);
      log("${response["access_token"]}");
      return 200;
    }
    return null;
  }

  @override
  Future<int?> register(
    String fullname,
    String phone,
    String email,
    String password,
    String passwordConfirmation,
    String municipioId,
  ) async {
    final Map<String, dynamic> body = {
      "nombre": fullname,
      "email": email,
      "telefono": phone,
      "municipio_id": municipioId,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
    final response =
        await _remote.post("https://semillero.contacta.com.co/api/login", body);
    if (response != null) {
      _local.writeStorage("AUTH_TOKEN", response["access_token"]);

      return 200;
    }
    return null;
  }
}

class AuthRepository {}
