import 'package:flutter/material.dart';
import 'package:rumah/awal.dart';
import 'package:rumah/chat1.dart';
import 'package:rumah/chat2.dart';
import 'package:rumah/chat3.dart';
import 'package:rumah/welcome.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  //oneSignal
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared
      .init("3648939e-5ee7-4d05-b815-9181ca5fb785", iOSSettings: null);
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  //oneSignal

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/williamlogo.png'),
        nextScreen: Welcome(),
        splashTransition: SplashTransition.fadeTransition,
      )));
  //Animated Splash Screen
}

class Rumah extends StatefulWidget {
  @override
  _RumahState createState() => _RumahState();
}

class _RumahState extends State<Rumah> {
  //OneSignal

  @override
  void initState() {
    super.initState();

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });
  }
  //OneSignal

  int _currentIndex = 0;

  final tabs = [
    Awal(),
    Chat1(),
    Chat2(),
    Chat3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xFFB7B7B7),
        selectedItemColor: Color(0xffFF4B5C),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 10),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "BookMark",
              style: TextStyle(fontSize: 10),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text(
              "Destination",
              style: TextStyle(fontSize: 10),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(
              "Notification",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
