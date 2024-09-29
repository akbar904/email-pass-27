
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/main.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('renders MyApp', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});
	});
}
