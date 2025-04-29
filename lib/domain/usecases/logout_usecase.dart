import '../../data/datasources/auth_remote_datasource.dart';

class LogoutUsecase {
  final AuthRemoteDatasource authRemoteDatasource;

  LogoutUsecase(this.authRemoteDatasource);

  Future<void> call() async {
    await authRemoteDatasource.logout();
  }
}