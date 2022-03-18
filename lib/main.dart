import 'package:flutter/material.dart';
import 'package:mvp_all/canvas/progress_view.dart';
import 'package:mvp_all/splash/splas_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
    //     overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVP_ALL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashView(),
      home: const ProgressView(),
    );
  }
}
