
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_state.dart';

void main() {
	group('AuthState', () {
		test('supports value equality', () {
			expect(
				AuthInitial(),
				AuthInitial(),
			);
		});

		test('props are correct', () {
			expect(AuthInitial().props, []);
			expect(AuthLoading().props, []);
			expect(AuthSuccess(User(email: 'test@example.com', name: 'Test User')).props, [User(email: 'test@example.com', name: 'Test User')]);
			expect(AuthFailure('Error message').props, ['Error message']);
		});
	});

	group('AuthInitial', () {
		test('toString returns correct value', () {
			expect(AuthInitial().toString(), 'AuthInitial');
		});
	});

	group('AuthLoading', () {
		test('toString returns correct value', () {
			expect(AuthLoading().toString(), 'AuthLoading');
		});
	});

	group('AuthSuccess', () {
		test('toString returns correct value', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			expect(AuthSuccess(user).toString(), 'AuthSuccess { user: $user }');
		});
	});

	group('AuthFailure', () {
		test('toString returns correct value', () {
			expect(AuthFailure('Error message').toString(), 'AuthFailure { error: Error message }');
		});
	});
}
