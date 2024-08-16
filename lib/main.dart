import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_pyramakerz/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.homeScreen,
      routes: {
        HomeScreen.homeScreen: (context) => const HomeScreen(),
      },
    );
  }
}
