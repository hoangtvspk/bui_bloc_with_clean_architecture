import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final result = await remoteDataSource.login(email, password);
      print("result => $result");
      return Right(
          User(token: result.data?.token ?? '', id: '', name: '', email: ''));
    } catch (e) {
      print(e);
      return Left(ServerFailure("Login Failed"));
    }
  }

  @override
  Future<Either<Failure, void>> register(
      String email, String password, String phoneNumber) async {
    try {
      final result =
          await remoteDataSource.register(email, password, phoneNumber);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure("Register Failed"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure("Logout Failed"));
    }
  }
}
