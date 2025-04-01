import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_with_clean_architectore/core/storage/secure_storage.dart';
import '../../../../core/error/failure.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(const AuthState.initial()) {
    on<LoginEvent>((event, emit) async {
      emit(const AuthState.loading());

      final Either<Failure, User> result = await loginUseCase(
        LoginParams(email: event.email, password: event.password),
      );

      await result.fold(
        (failure) async => emit(AuthState.failure(failure.message)),
        (user) async {
          await SecureStorage().writeAccessToken(user.token);
          if (!emit.isDone) {
            emit(AuthState.success(user));
          }
        },
      );
    });
  }
}
