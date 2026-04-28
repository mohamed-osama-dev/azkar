class ZikrEntity {
  final int id;
  final String text;
  final int repeatCount;
  final String? fadl;
  final int categoryId;

  const ZikrEntity({
    required this.id,
    required this.text,
    required this.repeatCount,
    this.fadl,
    required this.categoryId,
  });

  ZikrEntity copyWith({
    int? id,
    String? text,
    int? repeatCount,
    String? fadl,
    int? categoryId,
  }) {
    return ZikrEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      repeatCount: repeatCount ?? this.repeatCount,
      fadl: fadl ?? this.fadl,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
