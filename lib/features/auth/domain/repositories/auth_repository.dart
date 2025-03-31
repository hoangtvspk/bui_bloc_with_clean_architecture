import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> register({
    required String email,
    required String password, 
    required String phoneNumber,
    required String name,
  });
  Future<Either<Failure, void>> logout();
}
