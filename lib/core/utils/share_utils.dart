import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static Future<void> shareZikr({
    required String zikrText,
    String? fadl,
  }) async {
    final buffer = StringBuffer();
    buffer.writeln(zikrText);
    if (fadl != null && fadl.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('—');
      buffer.writeln(fadl);
    }
    buffer.writeln();
    buffer.writeln('🇸🇦');

    await Share.share(buffer.toString(), subject: 'ذكر من أذكار');
  }
}
