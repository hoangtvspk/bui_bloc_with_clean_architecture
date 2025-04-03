import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc_with_clean_architectore/features/auth/presentation/pages/login_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class MockAuthBloc extends Mock implements AuthBloc {
  final _controller = StreamController<AuthState>.broadcast();
  AuthState _currentState = const AuthState.initial();
  
  @override
  Stream<AuthState> get stream => _controller.stream;
  
  @override
  AuthState get state => _currentState;

  void emit(AuthState state) {
    _currentState = state;
    _controller.add(state);
  }

  @override
  Future<void> close() async {
    await _controller.close();
  }
}

class MockNavigationService extends Mock {
  Future<void> go(String location) async {
    noSuchMethod(Invocation.method(#go, [location]));
  }
}

class TestLoginPage extends StatelessWidget {

  const TestLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

late MockAuthBloc mockAuthBloc;
late MockNavigationService mockNavigationService;

void main() {
  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockNavigationService = MockNavigationService();
  });

  tearDown(() async {
    await mockAuthBloc.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => BlocProvider<AuthBloc>.value(
              value: mockAuthBloc,
              child: const TestLoginPage(),
            ),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const Scaffold(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const Scaffold(),
          ),
        ],
      ),
    );
  }

  testWidgets('should display login form with email and password fields',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.text("Don't have an account? Register"), findsOneWidget);
  });

  testWidgets('should show loading indicator when state is loading',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(createWidgetUnderTest());
    mockAuthBloc.emit(const AuthState.loading());
    await tester.pump();

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message when state is failure',
      (WidgetTester tester) async {
    // Arrange
    const errorMessage = 'Invalid credentials';
    await tester.pumpWidget(createWidgetUnderTest());
    mockAuthBloc.emit(const AuthState.failure(errorMessage));
    await tester.pump();

    // Assert
    expect(find.text('Error: $errorMessage'), findsOneWidget);
  });

  testWidgets('should call login event when login button is pressed with valid credentials',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(createWidgetUnderTest());

    // Act
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password123');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Assert
    verify(() => mockAuthBloc.add(
          AuthEvent.login(email: 'test@example.com', password: 'password123'),
        )).called(1);
  });

  testWidgets('should show success message when login is successful',
      (WidgetTester tester) async {
    // Arrange
    const userName = 'Test User';
    await tester.pumpWidget(createWidgetUnderTest());
    mockAuthBloc.emit(
      AuthState.success(User(
        id: '1',
        name: userName,
        email: 'test@example.com',
        token: 'test_token',
      )),
    );
    await tester.pump();

    // Assert
    expect(find.text('Welcome $userName'), findsOneWidget);
  });
} 