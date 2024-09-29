
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider<AuthCubit>(
					create: (context) => AuthCubit(),
				),
			],
			child: MaterialApp(
				title: 'Simple Cubit App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: BlocBuilder<AuthCubit, AuthState>(
					builder: (context, state) {
						if (state is AuthSuccess) {
							return HomeScreen();
						} else {
							return LoginScreen();
						}
					},
				),
			),
		);
	}
}
