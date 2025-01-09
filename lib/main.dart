import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qpbbxtgxsvzajmfnryhg.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwYmJ4dGd4c3Z6YWptZm5yeWhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYyNjYwMDgsImV4cCI6MjA1MTg0MjAwOH0.euZzImoloGBnafAKGLG9F4rLvMkUJhXxriZjAnqtOLU',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
