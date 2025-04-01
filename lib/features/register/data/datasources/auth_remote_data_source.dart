import '../../../../core/models/base_response.dart';
import '../../../../core/network/dio_client.dart';
import '../models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<BaseResponse<RegisterModel>> register(
      String email, String password, String phoneNumber, String name);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final dioClient = DioClient();

  @override
  Future<BaseResponse<RegisterModel>> register(
      String email, String password, String phoneNumber, String name) async {
    try {
      final response = await dioClient.post("/register", data: {
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "name": name,
      });

      return BaseResponse(data: RegisterModel.fromJson(response.data));
    } catch (e) {
      throw Exception("Register failed");
    }
  }
}
