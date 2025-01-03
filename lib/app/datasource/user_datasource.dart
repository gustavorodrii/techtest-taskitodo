import '../model/user_model.dart';
import '../service/result.dart';

class UserDatasource {
  Future<Result<UserModel>> fetchUser() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return Result.success(UserModel(
        name: 'John',
        imageProfile: 'assets/images/profile_image.png',
      ));
    } catch (e) {
      return Result.failure('Error');
    }
  }
}
