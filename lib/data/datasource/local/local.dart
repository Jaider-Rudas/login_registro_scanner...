abstract class Storage {
  Future<dynamic> readStorage(String key);
  Future<Map<String, String>?> readAllStorage(String key);
  Future<void> deleteStorage(String key);
  Future<void> deleteAllStorage();
  Future<bool> writeStorage(String key, String value);
}
