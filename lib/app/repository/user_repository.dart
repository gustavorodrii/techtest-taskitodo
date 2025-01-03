import '../datasource/user_datasource.dart';
import '../model/user_model.dart';
import '../service/result.dart';

class UserRepository {
  final UserDatasource localDatasource;

  UserRepository({required this.localDatasource});

  Future<Result<UserModel>> getUser() {
    return localDatasource.fetchUser();
  }
}
