import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._storage);
  final AuthRemoteDataSource _remote;
  final SecureStorageService _storage;

  @override
  Future<bool> isAuthenticated() async =>
      (await _storage.readToken())?.isNotEmpty ?? false;

  @override
  Future<void> login(String email, String password) async {
    final token = await _remote.login(email: email, password: password);
    await _storage.saveToken(token);
  }

  @override
  Future<void> logout() => _storage.clearToken();
}
