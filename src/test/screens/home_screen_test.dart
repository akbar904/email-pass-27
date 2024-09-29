
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';
import 'package:simple_cubit_app/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Mocking AuthCubit for the purpose of testing HomeScreen.
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('should display a logout button', (WidgetTester tester) async {
			// Arrange
			when(() => mockAuthCubit.state).thenReturn(AuthSuccess(user: User(email: 'test@example.com', name: 'Test User')));
			
			// Act
			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (context) => mockAuthCubit,
					child: const MaterialApp(home: HomeScreen()),
				),
			);
			
			// Assert
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('should call logout when logout button is pressed', (WidgetTester tester) async {
			// Arrange
			when(() => mockAuthCubit.state).thenReturn(AuthSuccess(user: User(email: 'test@example.com', name: 'Test User')));
			when(() => mockAuthCubit.logout()).thenReturn(null);
			
			// Act
			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (context) => mockAuthCubit,
					child: const MaterialApp(home: HomeScreen()),
				),
			);
			await tester.tap(find.text('Logout'));
			await tester.pumpAndSettle();
			
			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
