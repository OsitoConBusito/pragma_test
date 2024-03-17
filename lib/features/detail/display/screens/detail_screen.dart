import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:pragma_test/features/detail/display/screens/provider/notifier.dart';
import 'package:pragma_test/features/detail/display/screens/provider/provider.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/gen/strings.g.dart';
import 'package:pragma_test/theme/theme.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key, required this.catBreedModel});

  final CatBreedModel catBreedModel;

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  late final DetailNotifier notifier;

  @override
  void initState() {
    notifier = ref.read(catBreedImageProvider.notifier);
    notifier.eitherFailureOrCatBreedimage(widget.catBreedModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? state = ref.watch(catBreedImageProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.darkGreen,
            width: 1,
          ),
        ),
        title: Container(
          width: MediaQuery.sizeOf(context).width * 0.3,
          color: AppColors.darkGreen,
          child: Center(
            child: Text(
              t.cat.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: state == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    widget.catBreedModel.name ?? '',
                    style: const TextStyle(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Gap(16),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: state,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t.weight.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.blue,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${widget.catBreedModel.weight?.metric ?? 0} ',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const Text(
                                      'Kg',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              t.origin.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.blue,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.catBreedModel.origin ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Divider(
                            color: AppColors.lightGreen,
                            height: 16,
                          ),
                          const Gap(4),
                          Text(
                            t.detail_view,
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(4),
                          const Divider(
                            color: AppColors.lightGreen,
                            height: 16,
                          ),
                          Text(widget.catBreedModel.description ?? ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
