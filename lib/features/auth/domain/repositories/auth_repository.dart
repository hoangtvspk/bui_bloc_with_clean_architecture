import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> register(
      String email, String password, String phoneNumber);
  Future<Either<Failure, void>> logout();
}
