
import 'package:equatable/equatable.dart';
import 'package:com.example.simple_cubit_app/models/user.dart';

// Base class for AuthState
abstract class AuthState extends Equatable {
	@override
	List<Object> get props => [];
}

// Initial state
class AuthInitial extends AuthState {
	@override
	String toString() => 'AuthInitial';
}

// Loading state
class AuthLoading extends AuthState {
	@override
	String toString() => 'AuthLoading';
}

// Success state
class AuthSuccess extends AuthState {
	final User user;

	AuthSuccess(this.user);

	@override
	List<Object> get props => [user];

	@override
	String toString() => 'AuthSuccess { user: $user }';
}

// Failure state
class AuthFailure extends AuthState {
	final String error;

	AuthFailure(this.error);

	@override
	List<Object> get props => [error];

	@override
	String toString() => 'AuthFailure { error: $error }';
}
