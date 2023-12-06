import 'package:flutter/material.dart';
import 'package:tictactoe/bloc/game_bloc.dart';
import 'package:tictactoe/routes/app_router.dart';
import 'package:tictactoe/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Inter',
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
