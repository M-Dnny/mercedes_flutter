import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mercedes/utils/batteryClipPath.dart';

class CarProfile extends StatefulWidget {
  const CarProfile({super.key});

  @override
  State<CarProfile> createState() => _CarProfileState();
}

class _CarProfileState extends State<CarProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0D13),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6F0508).withOpacity(0.3),
                const Color(0xFF6F0508).withOpacity(0.2),
                const Color(0xFF0E0D13).withOpacity(0.6),
                const Color(0xFF0E0D13).withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Header()
                      .animate()
                      .fadeIn(duration: 3000.ms, curve: Curves.easeIn)
                      .slideY(
                          begin: -1,
                          end: 0,
                          duration: 1500.ms,
                          delay: 200.ms,
                          curve: Curves.fastLinearToSlowEaseIn),
                ),
                SizedBox(height: 20),
                Body1(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Body2(),
                      SizedBox(height: 20),
                      Body3()
                          .animate()
                          .fadeIn(duration: 3000.ms, curve: Curves.easeIn)
                          .slideY(
                              begin: 1,
                              end: 0,
                              duration: 1500.ms,
                              delay: 200.ms,
                              curve: Curves.fastLinearToSlowEaseIn),
                    ],
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

class Body3 extends StatelessWidget {
  const Body3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black38,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://shorturl.at/lrxD8"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Maroon 5',
                        style: Theme.of(context).textTheme.labelMedium),
                    Text('Animal',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.volume_up_rounded),
                        Icon(Icons.skip_previous_rounded),
                        Stack(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: CircularProgressIndicator(
                                value: 0.5,
                                strokeCap: StrokeCap.round,
                                color: Colors.red,
                              ),
                            ),
                            Icon(
                              Icons.play_circle_fill_rounded,
                              size: 45,
                            ),
                          ],
                        ),
                        Icon(Icons.skip_next_rounded),
                        Icon(Icons.repeat_rounded),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Body2 extends StatelessWidget {
  const Body2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black38,
            ),
            child: Column(
              children: [
                const BatteryCard(),
                const SizedBox(height: 5),
                Text(
                  '207 km',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text('Available to drive'),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 3000.ms, curve: Curves.easeIn).slideX(
            begin: -1,
            end: 0,
            duration: 1500.ms,
            delay: 200.ms,
            curve: Curves.fastLinearToSlowEaseIn),
        const SizedBox(width: 20),
        Expanded(
          child: Transform.flip(
            flipY: true,
            flipX: true,
            child: Container(
              height: 260,
              width: 170,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                      opacity: 0.5,
                      image: AssetImage(
                        "assets/images/map.jpg",
                      ))),
              child: Transform.flip(
                flipX: true,
                flipY: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.turn_slight_left_rounded),
                          Text(
                            "Turn left from here",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ).animate().fadeIn(duration: 3000.ms, curve: Curves.easeIn).slideX(
            begin: 1,
            end: 0,
            duration: 1500.ms,
            delay: 200.ms,
            curve: Curves.fastLinearToSlowEaseIn),
      ],
    );
  }
}

class BatteryCard extends StatelessWidget {
  const BatteryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: BatteryCustomPainter(),
      child: SizedBox(
        height: (130 * 1.4820512820512821).toDouble(),
        width: 130,
        child: Container(
          margin: const EdgeInsets.only(
            top: 85,
            bottom: 12,
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1AC26B),
                  const Color(0xFF1AC26B).withOpacity(0.6),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF1AC26B).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                    blurStyle: BlurStyle.normal),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '53%',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                '3h 25m',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Body1 extends StatelessWidget {
  const Body1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            width: 135,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Speed", style: Theme.of(context).textTheme.titleLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("120",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text("km/h",
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(duration: 3000.ms, curve: Curves.easeIn).slideX(
                begin: 1,
                end: 0,
                duration: 1500.ms,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
          Positioned(
            left: 0,
            top: 20,
            right: 0,
            child: Transform.flip(
              flipX: true,
              filterQuality: FilterQuality.high,
              child: Image.asset("assets/images/mercedes-3-bg.png"),
            ),
          ).animate().fadeIn(duration: 3000.ms, curve: Curves.easeIn).slideX(
                begin: -1,
                end: 0,
                duration: 1500.ms,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: const SizedBox(height: 90).blurred(
              blur: 6,
              blurColor: Colors.black26,
              colorOpacity: 0.2,
              borderRadius: BorderRadius.circular(15),
              overlay: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Car",
                            style: Theme.of(context).textTheme.titleSmall),
                        Text("Mercedes Benz GLA 45",
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(duration: 4000.ms, curve: Curves.easeIn),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage("https://rb.gy/j7mvkm"),
        ),
        Badge(
          label: const Text("3"),
          offset: const Offset(0, 5),
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.white,
                width: 0.3,
              ),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.notifications_rounded)
                .animate()
                .shake(duration: 3000.ms, curve: Curves.easeIn),
            label: const Text("Notifications"),
          ),
        ),
      ],
    );
  }
}
