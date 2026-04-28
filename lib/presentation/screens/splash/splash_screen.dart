import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: AppDimensions.splashDuration),
    );
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.islamicEmerald,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '☽',
              style: TextStyle(
                fontSize: 80,
                color: AppColors.islamicGold,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingLarge),
            Text(
              'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
              style: GoogleFonts.amiri(
                fontSize: AppDimensions.fontSizeLarge,
                color: AppColors.islamicGold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            Text(
              'أذكار',
              style: GoogleFonts.amiri(
                fontSize: AppDimensions.fontSizeTitle,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
