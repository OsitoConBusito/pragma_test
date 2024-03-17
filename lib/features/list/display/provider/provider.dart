import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/features/list/display/provider/notifier.dart';

final catBreedsProvider =
    StateNotifierProvider<ListNotifier, List<CatBreedModel>?>((ref) {
  return ListNotifier();
});
