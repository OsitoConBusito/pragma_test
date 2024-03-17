import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/features/list/display/provider/notifier.dart';
import 'package:pragma_test/features/list/display/provider/provider.dart';
import 'package:pragma_test/features/list/display/widgets/cat_breed_list_item_widget.dart';
import 'package:pragma_test/shared/widgets/widgets.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  late final ListNotifier notifier;

  @override
  void initState() {
    notifier = ref.read(catBreedsProvider.notifier);
    notifier.eitherFailureOrCatBreedsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CatBreedModel>? value = ref.watch(catBreedsProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => notifier.eitherFailureOrCatBreedsList(),
        child: BackgroundWidget(
          child: value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final data = value[index];
                    return CatBreedListItemWidget(data: data);
                  },
                  itemCount: value.length,
                ),
        ),
      ),
    );
  }
}
