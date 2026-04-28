import '../../domain/entities/azkar_entity.dart';
import '../../domain/entities/zikr_entity.dart';
import 'zikr_item_model.dart';

class AzkarModel extends AzkarEntity {
  const AzkarModel({
    required super.id,
    required super.title,
    required super.icon,
    required super.zikrList,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json, int index) {
    final content = json['content'] as List<dynamic>;
    return AzkarModel(
      id: index,
      title: json['title'] as String,
      icon: json['icon'] as String? ?? '',
      zikrList: content.asMap().entries.map((entry) {
        return ZikrItemModel.fromJson(
          entry.value as Map<String, dynamic>,
          index,
          entry.key,
        );
      }).toList(),
    );
  }

  List<ZikrEntity> get zikrEntities => zikrList;
}
