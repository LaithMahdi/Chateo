import 'package:chateo/src/api/crud.dart';
import '../../../api/api.dart';

class UserRemoteData {
  Crud crud;
  UserRemoteData(this.crud);

  signUpData(String username, String email, String password) async {
    var response = await crud.postData(Api.signUp, {
      "username": username,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
