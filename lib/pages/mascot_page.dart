import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive_app/models/enums.dart';
import 'package:rive_app/providers/mascot_providers.dart';
import 'package:rive_app/widgets/btn.dart';
import 'package:rive_app/widgets/hat.dart';
import 'package:rive_app/widgets/hat_selection.dart';
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

                Consumer(
                  builder: (context, ref, child) {
                    final mascotAction = ref.watch(
                      selectedMascotActionProvider,
                    );
                    final mascotHat = ref.watch(selectedMascotHatProvider);
                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 400,
                          child: Mascot(hat: mascotHat, action: mascotAction),
                        ),
                        SizedBox(height: 16),
                        MascotHatSelection(
                          hatOption: mascotHat,
                          onHatSelected: (hat) {
                            ref
                                .read(selectedMascotActionProvider.notifier)
                                .setMascotAction(MascotActions.none);
                            ref
                                .read(selectedMascotHatProvider.notifier)
                                .setMascotHat(hat);
                          },
                        ),
                        SizedBox(height: 16),
                        MascotBtn(
                          action: MascotActions.jump,
                          onActionSelected: (action) {
                            ref
                                .refresh(selectedMascotActionProvider.notifier)
                                .setMascotAction(action);
                          },
                        ),
                        MascotBtn(
                          action: MascotActions.wave,
                          onActionSelected: (action) {
                            ref
                                .refresh(selectedMascotActionProvider.notifier)
                                .setMascotAction(action);
                          },
                        ),
                      ],
                    );
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
