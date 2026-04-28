import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'data/datasources/azkar_local_datasource.dart';
import 'data/repositories/azkar_repository_impl.dart';
import 'domain/usecases/get_all_azkar_usecase.dart';
import 'presentation/providers/azkar_provider.dart';
import 'presentation/providers/sebha_provider.dart';
import 'presentation/providers/settings_provider.dart';
import 'presentation/providers/zikr_progress_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AzkarApp());
}

class AzkarApp extends StatelessWidget {
  const AzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = AzkarLocalDatasource();
    final repository = AzkarRepositoryImpl(datasource);
    final getAllAzkarUseCase = GetAllAzkarUseCase(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(
            create: (_) => AzkarProvider(getAllAzkarUseCase)),
        ChangeNotifierProvider(create: (_) => ZikrProgressProvider()),
        ChangeNotifierProvider(create: (_) => SebhaProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'أذكار',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppRouter.splash,
            onGenerateRoute: AppRouter.generateRoute,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
