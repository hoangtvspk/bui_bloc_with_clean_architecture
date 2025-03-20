import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/core/network/dio_client.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/presentation/bloc/auth_bloc.dart';
import 'core/router/app_router.dart';

void main() {
  final dioClient = DioClient(); // ✅ Use the existing DioClient
  final authRemoteDataSource = AuthRemoteDataSourceImpl(dioClient);
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(LoginUseCase(authRepository))),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
