import 'package:flutter/services.dart';
import 'package:fluttergrab/ui/router.dart';
import 'package:fluttergrab/locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        break;

      case AppLifecycleState.inactive:
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A+ Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amber[300], accentColor: Colors.brown[300]),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
