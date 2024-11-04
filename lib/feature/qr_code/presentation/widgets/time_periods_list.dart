import 'package:flutter/material.dart';

import '../../domain/entities/tiem_period_entity.dart';
import 'identity_card.dart';

class TimePeriodsList extends StatelessWidget {
  final void Function(int) select;
  final List<int> activeList;
  const TimePeriodsList({
    super.key,
    required this.select,
    required this.activeList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          shrinkWrap: true,
          childAspectRatio: 3.2,
          children: timePeriods.map((time) {
            return IdentityCard(
              title: time.time,
              activeStatus: activeList.contains(time.id),
              deviceId: time.id,
              onPress: (id) => select(id),
            );
          }).toList(),
        )
      ],
    );
  }
}
