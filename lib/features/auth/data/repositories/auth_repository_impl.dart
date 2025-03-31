import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
    Future<Either<Failure, User>> login({
      required String email,
      required String password,
    }) async {
    try {
      final result = await remoteDataSource.login(email, password);
      print("result => $result");
      return Right(
          User(token: result.data?.token ?? '', id: '', name: '', email: ''));
    } catch (e) {
      print(e);
      return const Left(ServerFailure("Login Failed"));
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      await remoteDataSource.register(
        name,
        email,
        password,
        phoneNumber,
      );
      return const Right(null);
    } catch (e) {
      print(e);
      return const Left(ServerFailure("Registration Failed"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      return Right(result);
    } catch (e) {
      print(e);
      return const Left(ServerFailure("Logout Failed"));
    }
  }
}
