import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twe/components/app.dart';
import 'package:twe/pages/LoginPage/login_page.dart';
import 'package:twe/provider/appProvider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => App(),
        '/login': (context) => LoginPage(),
      },
      title: 'TWE',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context)
                .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          )),
      // home: App(),
    );
  }
}
