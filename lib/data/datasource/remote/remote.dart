abstract class RemoteDataSource {
  Future<dynamic> get<T>(String url, {Map<String, String>? header});
  Future<dynamic> getById<T>(String url, String id, {Map<String, String>? header});
  Future<dynamic> post<T>(String url, Map<String, dynamic> body, {Map<String, String>? header});
  Future<dynamic> put<T>(String url, Map<String, dynamic> body, {Map<String, String>? header});
  Future<dynamic> delete<T>(String url, {Map<String, String>? header});
}
