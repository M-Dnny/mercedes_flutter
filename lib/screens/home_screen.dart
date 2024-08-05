import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mercedes/screens/car_profile_screen.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vibration/vibration.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0E0D13),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BGImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StartButton(),
              SizedBox(height: 30),
              InfoCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xFF000201).withOpacity(1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white24.withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, -2),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Icon(Icons.battery_6_bar_rounded),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("3h 25m", style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 2),
                  Text("Power",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white.withOpacity(0.5),
                          )),
                ],
              ),
            ],
          ).animate().fadeIn(duration: 800.ms).slideX(
                begin: 0.5,
                end: 0,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: 1000.ms,
              ),
          Row(
            children: [
              const Icon(Icons.navigation_rounded),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("207 km", style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 2),
                  Text("Available",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white.withOpacity(0.5),
                          )),
                ],
              ),
            ],
          ).animate().fadeIn(duration: 800.ms).slideX(
                begin: 0.5,
                end: 0,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: 1000.ms,
              ),
          Row(
            children: [
              const Icon(Icons.wb_cloudy_rounded),
              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("20°C", style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 2),
                  Text("Cloudy",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white.withOpacity(0.5),
                          )),
                ],
              ),
            ],
          ).animate().fadeIn(duration: 800.ms).slideX(
                begin: 0.5,
                end: 0,
                curve: Curves.fastEaseInToSlowEaseOut,
                duration: 1000.ms,
              ),
        ],
      ),
    );
  }
}

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  late AudioPlayer player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.dispose();
  }

  bool engineStart = false;
  int rippleCount = 40;

  void startEngine() async {
    if (!engineStart) {
      setState(() {
        engineStart = true;
        rippleCount = 55;
      });

      if (await Vibration.hasVibrator() != null) {
        Vibration.vibrate(pattern: [
          0,
          10,
          50,
          100,
          150,
          200,
          500,
          3000,
          2000,
        ]);
      }

      player = AudioPlayer();
      await player.setReleaseMode(ReleaseMode.stop);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await player.play(AssetSource('sound/start.mp3'));
        Future.delayed(3600.ms, () async {
          Future.delayed(1.ms, () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return const CarProfile();
                },
              ),
            );
          });

          await player.stop();

          setState(() {
            engineStart = false;
            rippleCount = 40;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        startEngine();
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF000201).withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                color: Colors.white24.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 3),
              )
            ]),
        child: RippleAnimation(
          color: const Color(0xFF760102),
          delay: const Duration(milliseconds: 100),
          repeat: true,
          minRadius: 15,
          ripplesCount: rippleCount,
          duration: const Duration(milliseconds: 1000),
          child: Container(
            margin: const EdgeInsets.all(23),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF0E0D13),
              border: Border.all(
                color: const Color(0xFF760102),
                width: 4,
              ),
              shape: BoxShape.circle,
            ),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  width: 45,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 8,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF760102),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "START ENGINE",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BGImage extends StatelessWidget {
  const BGImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -410,
      bottom: 250,
      left: 0,
      right: -70,
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
          "assets/images/mercedes-4.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
