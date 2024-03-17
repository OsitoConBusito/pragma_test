import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/features/detail/display/screens/provider/notifier.dart';

final catBreedImageProvider =
    StateNotifierProvider.autoDispose<DetailNotifier, String?>((ref) {
  return DetailNotifier();
});
