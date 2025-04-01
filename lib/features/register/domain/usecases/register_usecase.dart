import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/register_repository.dart';

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}

class RegisterUseCase implements UseCase<void, RegisterParams> {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      phoneNumber: params.phoneNumber,
    );
  }
}
