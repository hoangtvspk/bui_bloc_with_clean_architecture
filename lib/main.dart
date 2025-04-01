import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/core/config/env_config.dart';
import 'package:flutter_bloc_with_clean_architectore/core/storage/secure_storage.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/presentation/bloc/auth_bloc.dart';

import 'core/router/app_router.dart';

void main() async {

  const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
  await EnvConfig.initialize(environment);
  final authRemoteDataSource = AuthRemoteDataSourceImpl();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  final token = await SecureStorage().readAccessToken();
  final initialRoute = token != null ? '/home' : '/';

  
  runApp(MyApp(authRepository: authRepository, initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(LoginUseCase(authRepository))),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: createRouter(initialRoute),
      ),
    );
  }
}
