import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> register({
    required String email,
    required String password,
    required String phoneNumber,
    required String name,
  });
}
