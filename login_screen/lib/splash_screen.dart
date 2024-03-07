//splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      //navigator to navigate between screens
      //in push it will back screen but of won't take him back
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.lightGreen, Colors.yellow],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Question Bank",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
