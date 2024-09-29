
import 'dart:convert';
import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String email;
	final String name;

	User({
		required this.email,
		required this.name,
	});

	@override
	List<Object> get props => [email, name];

	Map<String, dynamic> toJson() {
		return {
			'email': email,
			'name': name,
		};
	}

	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			email: json['email'],
			name: json['name'],
		);
	}

	@override
	bool get stringify => true;
}
