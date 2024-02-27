import 'package:data/storage/provider/preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPreferences {
  static StateProvider<bool> isOnBoardComplete = createPrefProvider<bool>(
    prefKey: "is_onboard_complete",
    defaultValue: false,
  );
}