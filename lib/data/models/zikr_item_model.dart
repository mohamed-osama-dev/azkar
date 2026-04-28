import '../../domain/entities/zikr_entity.dart';

class ZikrItemModel extends ZikrEntity {
  const ZikrItemModel({
    required super.id,
    required super.text,
    required super.repeatCount,
    super.fadl,
    required super.categoryId,
  });

  factory ZikrItemModel.fromJson(
      Map<String, dynamic> json, int categoryId, int index) {
    return ZikrItemModel(
      id: index,
      text: json['text'] as String,
      repeatCount: json['repeat'] as int,
      fadl: json['fadl'] as String?,
      categoryId: categoryId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'repeat': repeatCount,
      'fadl': fadl,
    };
  }
}
