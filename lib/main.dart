import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_mart/app/config/themes/app_themes.dart';
import 'package:metro_mart/providers/auth_provider.dart';
import 'package:metro_mart/providers/notes_provider.dart';
import 'package:metro_mart/screens/auth_state_builder.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NotesProvider(),
          ),
        ],
        builder: (context, child) => ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Real Estate',
                theme: AppThemes().theme,
                home: const AuthStateBuilder(),
              );
            }));
  }
}
