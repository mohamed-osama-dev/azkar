import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/utils/share_utils.dart';
import '../../providers/azkar_provider.dart';
import '../../providers/settings_provider.dart';
import '../../providers/zikr_progress_provider.dart';

class ZikrScreen extends StatefulWidget {
  final String categoryTitle;
  final int categoryId;

  const ZikrScreen({
    super.key,
    required this.categoryTitle,
    required this.categoryId,
  });

  @override
  State<ZikrScreen> createState() => _ZikrScreenState();
}

class _ZikrScreenState extends State<ZikrScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final azkar =
          context.read<AzkarProvider>().getAzkarById(widget.categoryId);
      if (azkar != null) {
        context.read<ZikrProgressProvider>().initProgress(azkar.zikrList);
      }
    });
  }

  void _onZikrTap(int index) {
    final provider = context.read<ZikrProgressProvider>();
    final settings = context.read<SettingsProvider>();
    if (settings.soundEnabled) {
      HapticUtils.mediumImpact();
    }
    provider.decrement(index);
    if (provider.allComplete) {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppStrings.completion,
          style: GoogleFonts.amiri(
            fontSize: AppDimensions.fontSizeLarge,
            color: AppColors.islamicEmerald,
          ),
        ),
        content: Text(
          AppStrings.acceptDua,
          style: GoogleFonts.amiri(fontSize: AppDimensions.fontSizeMedium),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(AppStrings.returnHome),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ZikrProgressProvider>().reset();
            },
          ),
        ],
      ),
      body: Consumer2<AzkarProvider, ZikrProgressProvider>(
        builder: (context, azkarProvider, progressProvider, child) {
          final azkar = azkarProvider.getAzkarById(widget.categoryId);
          if (azkar == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingMedium),
                child: Text(
                  '${progressProvider.completedCount} / ${azkar.zikrList.length}',
                  style: GoogleFonts.amiri(
                    fontSize: AppDimensions.fontSizeMedium,
                    color: AppColors.islamicGold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppDimensions.paddingMedium),
                  itemCount: azkar.zikrList.length,
                  itemBuilder: (context, index) {
                    final zikr = azkar.zikrList[index];
                    final remaining = progressProvider.progressMap[index] ?? 0;
                    final isComplete = remaining == 0;

                    return _ZikrCard(
                      text: zikr.text,
                      fadl: zikr.fadl,
                      repeat: zikr.repeatCount,
                      remaining: remaining,
                      isComplete: isComplete,
                      onTap: () => _onZikrTap(index),
                      shareTap: () => ShareUtils.shareZikr(
                        zikrText: zikr.text,
                        fadl: zikr.fadl,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ZikrCard extends StatefulWidget {
  final String text;
  final String? fadl;
  final int repeat;
  final int remaining;
  final bool isComplete;
  final VoidCallback onTap;
  final VoidCallback shareTap;

  const _ZikrCard({
    required this.text,
    this.fadl,
    required this.repeat,
    required this.remaining,
    required this.isComplete,
    required this.onTap,
    required this.shareTap,
  });

  @override
  State<_ZikrCard> createState() => _ZikrCardState();
}

class _ZikrCardState extends State<_ZikrCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = context.watch<SettingsProvider>().fontSize;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: Card(
          margin: const EdgeInsets.only(bottom: AppDimensions.paddingMedium),
          color: widget.isComplete
              ? AppColors.islamicEmerald.withOpacity(0.2)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.isComplete)
                      const Icon(Icons.check_circle,
                          color: AppColors.islamicEmerald),
                    IconButton(
                      icon: const Icon(Icons.share, size: 20),
                      onPressed: widget.shareTap,
                    ),
                  ],
                ),
                Text(
                  widget.text,
                  style: GoogleFonts.amiri(
                    fontSize: fontSize,
                    height: 1.9,
                  ),
                ),
                if (widget.fadl != null && widget.fadl!.isNotEmpty) ...[
                  const Divider(),
                  Text(
                    widget.fadl!,
                    style: GoogleFonts.amiri(
                      fontSize: fontSize - 4,
                      color: AppColors.islamicGold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: AppDimensions.paddingSmall),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                    vertical: AppDimensions.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.islamicGold.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusCircle),
                  ),
                  child: Text(
                    '${widget.remaining}',
                    style: GoogleFonts.amiri(
                      fontSize: AppDimensions.fontSizeMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
