import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/theme_provider.dart';
import '../../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: Consumer2<SettingsProvider, ThemeProvider>(
        builder: (context, settings, theme, child) {
          return ListView(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            children: [
              _SettingTile(
                title: AppStrings.darkMode,
                trailing: Switch(
                  value: theme.isDarkMode,
                  onChanged: (_) => theme.toggleTheme(),
                ),
              ),
              _SettingTile(
                title: AppStrings.fontSize,
                subtitle: '${settings.fontSize.toInt()}',
                trailing: SizedBox(
                  width: 200,
                  child: Slider(
                    value: settings.fontSize,
                    min: AppDimensions.fontSizeMin,
                    max: AppDimensions.fontSizeMax,
                    onChanged: settings.setFontSize,
                  ),
                ),
              ),
              _SettingTile(
                title: AppStrings.soundEnabled,
                trailing: Switch(
                  value: settings.soundEnabled,
                  onChanged: (_) => settings.toggleSound(),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  AppStrings.clearData,
                  style:
                      GoogleFonts.amiri(fontSize: AppDimensions.fontSizeMedium),
                ),
                trailing: const Icon(Icons.delete_outline),
                onTap: () async {
                  await settings.clearData();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم مسح البيانات')),
                    );
                  }
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  '${AppStrings.appVersion}: 1.0.0',
                  style:
                      GoogleFonts.amiri(fontSize: AppDimensions.fontSizeSmall),
                ),
                subtitle: Text(
                  'developed with ❤️',
                  style:
                      GoogleFonts.amiri(fontSize: AppDimensions.fontSizeSmall),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget trailing;

  const _SettingTile({
    required this.title,
    this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.amiri(fontSize: AppDimensions.fontSizeMedium),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: GoogleFonts.amiri(
                fontSize: AppDimensions.fontSizeSmall,
                color: AppColors.islamicGold,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}
