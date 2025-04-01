import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(this.remoteDataSource);

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
}
