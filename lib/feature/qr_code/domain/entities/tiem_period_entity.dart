import 'package:intelligent_security_systems/generated/l10n.dart';

class TimePeriodEntity {
  final String time;
  final int id;

  TimePeriodEntity({required this.time, required this.id});
}

List<TimePeriodEntity> timePeriods = [
  TimePeriodEntity(time: S.current.timeHours(2), id: 0),
  TimePeriodEntity(time: S.current.timeHours(4), id: 1),
  TimePeriodEntity(time: S.current.timeHours(8), id: 2),
  TimePeriodEntity(time: S.current.timeHours(12), id: 3),
  TimePeriodEntity(time: S.current.timeHours(24), id: 4),
];