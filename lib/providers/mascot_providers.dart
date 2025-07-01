import 'package:rive_app/models/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mascot_providers.g.dart';

@riverpod
class SelectedMascotHat extends _$SelectedMascotHat {
  @override
  MascotHatOptions build() {
    return MascotHatOptions.none;
  }

  void setMascotHat(MascotHatOptions hat) {
    state = hat;
  }
}

@riverpod
class SelectedMascotAction extends _$SelectedMascotAction {
  @override
  MascotActions build() {
    return MascotActions.none;
  }

  void setMascotAction(MascotActions action) {
    state = action;
  }
}
