import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/core/storage/secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = '';

  @override
  void initState() {
    super.initState();
    setToken();
  }

  void setToken() async {
    final storageToken = await SecureStorage().readAccessToken();
    setState(() {
         token = storageToken ?? 'No token';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate to Login Page (if needed)
              context.read<AuthBloc>().add(const AuthEvent.logout());
              context.go('/');
            },
          ),
        ],
      ),
      body:   Column(
        spacing: 20,
        children: [
          Center(
            child: context.watch<AuthBloc>().state.maybeWhen(
              success: (user) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome back,'),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              orElse: () => const SizedBox(),
            ),),
            Text(token),
        ],
      ),
    );
  }
}
