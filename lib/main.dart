import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flame_bloc/flame_bloc.dart';

import 'Pages/MyHomePage.dart';

import 'Blocs/LoaderBloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/level",
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/level":
            return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(providers: [
                      BlocProvider(
                          create: (context) =>
                              LoaderBloc(selectLevel: "Level 1")),
                    ], child: MyHomePage(title: 'Flutter Demo Home Page')));
            break;
          default:
        }
      },
    );
  }
}
