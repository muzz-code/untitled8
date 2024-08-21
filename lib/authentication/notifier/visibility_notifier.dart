import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../global.dart';
import '../../core/utils/constants.dart';

part 'visibility_notifier.g.dart';

@riverpod
class VisibilityNotifier extends _$VisibilityNotifier {
  @override
  bool build() {
    return Global.storageService.getBool(AppConstants.ACCOUNTVISIBILITY) ?? false;
  }

  void togglePasswordVisibility() {
    state = !state;
  }

  void toggleAccountBalanceVisibility() {
    state = !state;
    Global.storageService.setBool(AppConstants.ACCOUNTVISIBILITY, state);
  }

  bool getAccountBalanceVisibility() {
    return Global.storageService.getBool(AppConstants.ACCOUNTVISIBILITY) ?? false;
  }
}
