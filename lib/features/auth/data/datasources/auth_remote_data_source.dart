import '../../../../core/network/dio_client.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      // final response = await dioClient.post("/login", data: {
      //   "email": email,
      //   "password": password,
      // });

      return LoginModel(id: "id", name: "name", email: email, token: "token");
    } catch (e) {
      throw Exception("Login failed");
    }
  }
}
