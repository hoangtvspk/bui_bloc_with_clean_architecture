import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegisterState.initial()) {
    on<Register>(_onRegister);
  }

  Future<void> _onRegister(
    Register event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.loading());

    final result = await _authRepository.register(
      name: event.name,
      email: event.email,
      password: event.password,
      phoneNumber: event.phoneNumber,
    );

    emit(result.fold(
      (failure) => RegisterState.failure(failure.message),
      (_) => const RegisterState.success(),
    ));
  }
} 