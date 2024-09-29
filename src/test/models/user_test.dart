
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/models/user.dart';

void main() {
	group('User Model', () {
		test('User should be instantiated with correct values', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			expect(user.email, equals('test@example.com'));
			expect(user.name, equals('Test User'));
		});

		test('User should serialize to JSON correctly', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			final json = user.toJson();
			expect(json, equals({'email': 'test@example.com', 'name': 'Test User'}));
		});

		test('User should deserialize from JSON correctly', () {
			final json = {'email': 'test@example.com', 'name': 'Test User'};
			final user = User.fromJson(json);
			expect(user.email, equals('test@example.com'));
			expect(user.name, equals('Test User'));
		});

		test('User supports value equality', () {
			final user1 = User(email: 'test@example.com', name: 'Test User');
			final user2 = User(email: 'test@example.com', name: 'Test User');
			expect(user1, equals(user2));
		});
	});
}
