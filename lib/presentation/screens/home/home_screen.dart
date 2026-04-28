import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_router.dart';
import '../../providers/azkar_provider.dart';
import '../../widgets/islamic_header_painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('☽ ', style: TextStyle(fontSize: 28)),
            Text(
              AppStrings.appName,
              style: GoogleFonts.amiri(
                fontSize: AppDimensions.fontSizeTitle,
                fontWeight: FontWeight.bold,
                color: AppColors.islamicGold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRouter.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
            child: CustomPaint(
              painter: IslamicHeaderPainter(),
              size: const Size(double.infinity, 24),
            ),
          ),
          Expanded(
            child: Consumer<AzkarProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(AppDimensions.paddingMedium),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: AppDimensions.paddingMedium,
                    mainAxisSpacing: AppDimensions.paddingMedium,
                  ),
                  itemCount: provider.azkarList.length,
                  itemBuilder: (context, index) {
                    final azkar = provider.azkarList[index];
                    return _CategoryCard(
                      title: azkar.title,
                      icon: azkar.icon,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRouter.sebha),
        child: const Text('📿', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final int index;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = index < AppColors.categoryGradients.length
        ? AppColors.categoryGradients[index]
        : [AppColors.islamicEmerald, AppColors.islamicDeepGreen];

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.zikr,
          arguments: {'title': title, 'id': index},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: AppDimensions.paddingSmall),
            Text(
              title,
              style: GoogleFonts.amiri(
                fontSize: AppDimensions.fontSizeMedium,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
