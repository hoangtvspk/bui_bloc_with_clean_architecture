import 'package:flutter_bloc_with_clean_architectore/core/storage/secure_storage.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/data/models/register/register_model.dart';

import '../../../../core/models/base_response.dart';
import '../../../../core/network/dio_client.dart';
import '../models/login/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<LoginModel>> login(String email, String password);
  Future<BaseResponse<RegisterModel>> register(
      String email, String password, String phoneNumber);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<BaseResponse<LoginModel>> login(String email, String password) async {
    try {
      // final response = await dioClient.post("/login", data: {
      //   "email": email,
      //   "password": password,
      // });

      return BaseResponse(
          data:
              LoginModel(id: "id", name: "name", email: email, token: "token"));
    } catch (e) {
      throw Exception("Login failed");
    }
  }

  @override
  Future<BaseResponse<RegisterModel>> register(
      String email, String password, String phoneNumber) async {
    try {
      final response = await dioClient.post("/register", data: {
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      });

      return BaseResponse(data: RegisterModel.fromJson(response.data));
    } catch (e) {
      throw Exception("Register failed");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await SecureStorage().deleteAccessToken();
      await SecureStorage().deleteRefreshToken();
    } catch (e) {
      throw Exception("Logout failed");
    }
  }
}
