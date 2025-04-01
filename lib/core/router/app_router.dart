import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/core/network/dio_client.dart';
import 'package:flutter_bloc_with_clean_architectore/core/utils/app_utils.dart';
import 'package:flutter_bloc_with_clean_architectore/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc_with_clean_architectore/features/register/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_bloc_with_clean_architectore/features/register/domain/repositories/register_repository.dart';
import 'package:flutter_bloc_with_clean_architectore/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/features/register/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart' show LoginPage;
import '../../features/register/data/repositories/auth_repository_impl.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    RouteUtils.createPageBloc<RegisterBloc, RegisterRepository,
        RegisterRemoteDataSource>(
      createDataSource: () => RegisterRemoteDataSourceImpl(),
      createRepository: (dataSource) => RegisterRepositoryImpl(dataSource),
      bloc: (repository) => RegisterBloc(registerRepository: repository),
      child: const RegisterPage(),
    ),
  ],
);
