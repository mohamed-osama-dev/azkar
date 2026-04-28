import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../providers/sebha_provider.dart';
import '../../providers/settings_provider.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.sebha),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<SebhaProvider>().reset(),
          ),
        ],
      ),
      body: Consumer<SebhaProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      final settings = context.read<SettingsProvider>();
                      if (settings.soundEnabled) {
                        HapticUtils.mediumImpact();
                      }
                      provider.increment();
                    },
                    child: Container(
                      width: AppDimensions.sebhaButtonSize,
                      height: AppDimensions.sebhaButtonSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.islamicEmerald,
                            AppColors.islamicDeepGreen
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${provider.counter}',
                              style: GoogleFonts.amiri(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: AppColors.islamicGold,
                              ),
                            ),
                            Text(
                              provider.currentZikr,
                              style: GoogleFonts.amiri(
                                fontSize: AppDimensions.fontSizeMedium,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingLarge),
                child: Wrap(
                  spacing: AppDimensions.paddingSmall,
                  runSpacing: AppDimensions.paddingSmall,
                  alignment: WrapAlignment.center,
                  children: [
                    _ZikrChip(text: AppStrings.subhanAllah, provider: provider),
                    _ZikrChip(text: AppStrings.alhamdullah, provider: provider),
                    _ZikrChip(text: AppStrings.allahuAkbar, provider: provider),
                    _ZikrChip(
                        text: AppStrings.laIlahaIllAllah, provider: provider),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ZikrChip extends StatelessWidget {
  final String text;
  final SebhaProvider provider;

  const _ZikrChip({required this.text, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isSelected = provider.currentZikr == text;

    return GestureDetector(
      onTap: () => provider.setZikr(text),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.islamicGold
              : AppColors.islamicGold.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppDimensions.radiusCircle),
        ),
        child: Text(
          text,
          style: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeSmall,
            color: isSelected ? AppColors.islamicDarkBg : AppColors.islamicGold,
          ),
        ),
      ),
    );
  }
}
