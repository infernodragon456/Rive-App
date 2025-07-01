import 'package:flutter/material.dart';
import 'package:rive_app/models/enums.dart';
import 'package:rive_app/widgets/btn.dart';
import 'package:rive_app/widgets/hat.dart';
import 'package:rive_app/widgets/icn.dart';
import 'package:rive_app/widgets/mascot.dart';
import 'package:rive_app/widgets/mascot_title.dart';

class MascotPage extends StatelessWidget {
  MascotPage({super.key});
  final hats =
      MascotHatOptions.values.where((e) => e != MascotHatOptions.none).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: MascotIcon())],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color.fromARGB(255, 15, 159, 216)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(scale: 6, child: MascotTitle()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 400,
                  child: Mascot(),
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...hats.map(
                      (e) => MascotHat(
                        hat: e,
                        onHatSelected: (hat) {
                          print(hat);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                MascotBtn(
                  action: MascotActions.jump,
                  onActionSelected: (action) {
                    print(action);
                  },
                ),
                MascotBtn(
                  action: MascotActions.wave,
                  onActionSelected: (action) {
                    print(action);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
