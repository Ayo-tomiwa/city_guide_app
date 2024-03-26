// import 'package:city_guide_app/cubit/app_cubit_logics.dart';
import 'package:city_guide_app/cubit/app_cubits.dart';
// import 'package:city_guide_app/pages/login/login.dart';
import 'package:city_guide_app/pages/welcome_page.dart';
import 'package:city_guide_app/services/data_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityGuide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: const WelcomePage(),
      ),
    );
  }
}
