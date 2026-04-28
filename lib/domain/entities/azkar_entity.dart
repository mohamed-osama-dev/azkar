import 'zikr_entity.dart';

class AzkarEntity {
  final int id;
  final String title;
  final String icon;
  final List<ZikrEntity> zikrList;

  const AzkarEntity({
    required this.id,
    required this.title,
    required this.icon,
    required this.zikrList,
  });
}
