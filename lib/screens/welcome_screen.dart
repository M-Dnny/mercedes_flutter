import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mercedes/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0D13),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImg(),
          const Content(),
        ],
      ),
    );
  }
}

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -280,
      top: -220,
      right: 0,
      child: Hero(
        tag: "splashImg",
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xFF0E0D13),
                ])),
            child: Image.asset(
              "assets/images/mercedes-1.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  goToHome(context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return const Home();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("AMG GLA 45 2021",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey)),
          const SizedBox(height: 5),
          Text("Mercedes Benz",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            "Welcome to Mercedes${"\n"}Benz Controller",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                goToHome(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF1F3A),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: const Color(0xFFFF1F3A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              child: const Text("Let's Go"),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    ).animate().fadeIn(duration: 2000.ms, curve: Curves.easeInToLinear).slideY(
          begin: 0.2,
          end: 0,
          duration: 1700.ms,
          curve: Curves.easeIn,
        );
  }
}
