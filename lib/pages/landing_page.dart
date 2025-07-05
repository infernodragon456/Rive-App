import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive_app/providers/mascot_providers.dart';
import 'package:rive_app/widgets/mascot.dart';
import 'package:rive_app/widgets/mascot_title.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/mascot');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Consumer(
                  builder: (context, ref, child) {
                    final name = ref.watch(selectedMascotNameProvider);
                    return MascotTitle(name: name);
                  },
                ),
              )
              .animate()
              .scaleXY(
                alignment: Alignment.bottomCenter,
                begin: 0.8,
                end: 2,
                duration: 1.seconds,
              )
              .fadeIn(curve: Curves.easeInOut, duration: 1.seconds),

          Positioned(
                top: 0,
                left: 20,
                right: 20,
                bottom: -500,
                child: Transform.scale(scale: 1.5, child: Mascot()),
              )
              .animate()
              .slideY(
                begin: 0.45,
                end: 0,
                curve: Curves.easeInOut,
                duration: 2.seconds,
              )
              .fadeIn(curve: Curves.easeInOut, duration: 2.seconds),
        ],
      ),
    );
  }
}
