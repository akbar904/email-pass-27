
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_state.dart';
import 'package:com.example.simple_cubit_app/models/user.dart';

// Mock dependencies (if any)
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;
		
		setUp(() {
			authCubit = AuthCubit();
		});
		
		tearDown(() {
			authCubit.close();
		});
		
		test('initial state is AuthInitial', () {
			expect(authCubit.state, equals(AuthInitial()));
		});
		
		blocTest<AuthCubit, AuthState>(
			'login emits [AuthLoading, AuthSuccess] when login succeeds',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthLoading(),
				AuthSuccess(User(email: 'test@example.com', name: 'Test User')),
			],
		);
		
		blocTest<AuthCubit, AuthState>(
			'logout emits [AuthInitial] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [
				AuthInitial(),
			],
		);
	});
}
