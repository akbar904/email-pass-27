
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.simple_cubit_app/models/user.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		emit(AuthLoading());
		// Simulating network request delay
		await Future.delayed(Duration(seconds: 2));
		// Here should be the actual authentication logic, for now we simulate a successful login
		final user = User(email: email, name: 'Test User');
		emit(AuthSuccess(user));
	}

	void logout() {
		emit(AuthInitial());
	}
}

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
	final User user;

	const AuthSuccess(this.user);

	@override
	List<Object> get props => [user];
}
