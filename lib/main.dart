import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form_example/provider/form_provider.dart';
import 'package:provider_form_example/screen/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
           providers: [
        ChangeNotifierProvider(create: (context) => FormProvider()),
       
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FormScreen(),
      ),
    );
  }
}





