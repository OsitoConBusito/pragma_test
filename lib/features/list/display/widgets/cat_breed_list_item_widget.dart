import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_test/core/navigation/navigation.dart';
import 'package:pragma_test/features/list/data/models/cat_breed_model.dart';
import 'package:pragma_test/gen/strings.g.dart';
import 'package:pragma_test/theme/theme.dart';

class CatBreedListItemWidget extends StatelessWidget {
  const CatBreedListItemWidget({
    super.key,
    required this.data,
  });

  static const containerHeight = 100.0;

  final CatBreedModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(detail, extra: data),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: AppColors.darkGreen,
        ),
        child: SizedBox(
          height: containerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        data.name ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.energy_level,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Gap(8),
                          LinearProgressIndicator(
                            backgroundColor: Colors.white,
                            color: AppColors.green,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            value: (data.energyLevel ?? 0) / 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Gap(16),
                  if ((data.catFriendly ?? 0) > 2)
                    SizedBox(
                      height: containerHeight,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          AppImages.catFriendlyIcon,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  const Gap(16),
                  if ((data.dogFriendly ?? 0) > 2)
                    SizedBox(
                      height: containerHeight,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          AppImages.dogFriendlyIcon,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
