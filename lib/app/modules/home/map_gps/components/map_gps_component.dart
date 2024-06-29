import 'package:angelhack_hcm/app/shared/utils/ui_utils.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:angelhack_hcm/app/data/di.dart';
import 'package:angelhack_hcm/app/shared/styles/app_design.dart';

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    required this.separator,
    super.key,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Widget separator;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ..._buildChildren(),
      ],
    );
  }

  Iterable<Widget> _buildChildren() sync* {
    for (var i = 0; i < children.length; i++) {
      yield children[i];
      if (i < children.length - 1) yield separator;
    }
  }
}

class MapGPSItem extends StatelessWidget {
  const MapGPSItem({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(16),
      decoration: AppDesign.boxDecorationContainerCardShadow(
        Theme.of(context).colorScheme.surface,
        $r.theme.shadow,
        16,
        0,
        2,
        16,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saigon Center',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Gap(12),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: $r.theme.grey2,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10:45 25/06/2024',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              children: [
                                const Gap(8),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FluentIcons.drop_20_regular,
                                        size: 20.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      const Gap(8),
                                      Text(
                                        localeLang.pH,
                                        style: $r.styles.pRegular.copyWith(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '7.5',
                                        style: $r.styles.pRegular.copyWith(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FluentIcons.water_20_regular,
                                        size: 20.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      const Gap(8),
                                      Text(
                                        localeLang.TDS,
                                        style: $r.styles.pRegular.copyWith(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '200',
                                        style: $r.styles.pRegular.copyWith(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
