
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('should display error message when login fails', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([AuthFailure('Invalid credentials')]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.pump();

			expect(find.text('Invalid credentials'), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthSuccess] when login is successful',
			build: () => MockAuthCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => <AuthState>[
				AuthLoading(),
				AuthSuccess(User(email: 'test@example.com', name: 'Test User')),
			],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthFailure] when login fails',
			build: () => MockAuthCubit(),
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => <AuthState>[
				AuthLoading(),
				AuthFailure('Invalid credentials'),
			],
		);
	});
}
