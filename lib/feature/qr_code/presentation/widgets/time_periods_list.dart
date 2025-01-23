import 'package:flutter/material.dart';

import '../../domain/entities/tiem_period_entity.dart';
import 'identity_card.dart';

class TimePeriodsList extends StatelessWidget {
  final void Function(int) select;
  final List<int> activeList;
  final List<TimePeriodEntity> timeList;
  const TimePeriodsList({
    super.key,
    required this.select,
    required this.activeList,
    required this.timeList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: timeList.length,
      separatorBuilder: (context,index){
        return const SizedBox(width: 8.0);
      },
      itemBuilder: (BuildContext context, int index) {
        return IdentityCard(
          title: timeList[index].time,
          activeStatus: activeList.contains(timeList[index].id),
          deviceId: timeList[index].id,
          onPress: (id) => select(id),
        );
      },
    );
  }
}
