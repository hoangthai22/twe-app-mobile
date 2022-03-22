import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/models/user.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // you need to initialize firebase first
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  FlutterNativeSplash.removeAfter(initialization);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: const MyApp(),
  ));
}

void initialization(BuildContext context) async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate, // ONLY if it's a RTL language
        ],
        supportedLocales: const [
          Locale('vi', 'VN'), // include country code too
        ],
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'CocLen',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFEFEFEF),
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context)
                  .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
            )),
        builder: EasyLoading.init(),
        // home: App(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  checkUserAuth() async {
    try {
      User user = await auth.currentUser!;
      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUserAuth().then((success) {
      if (success != null) {
        print("login");
        context.read<AppProvider>().setUserLogin(success.email);
        context.read<AppProvider>().setUid(success.uid);
        context.read<AppProvider>().setIsLogin();

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
