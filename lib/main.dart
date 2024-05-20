import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ldghjrbhtlxswtwbapmz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkZ2hqcmJodGx4c3d0d2JhcG16Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU2OTM0MjksImV4cCI6MjAzMTI2OTQyOX0.4P7UAwlC-vpu4AUIzamSBo7zBTRLDeuSgHTRaratUuk',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
