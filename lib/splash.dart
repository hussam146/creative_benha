import 'dart:async';
import 'package:creative_benha/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), navigate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        // fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/splash.jpg",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 180.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 136, 0),
                  ),
                ),
              ),
              Text(
                "Antiquies Gallary",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 255, 136, 0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
