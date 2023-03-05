import 'package:flutter/material.dart';
import 'package:fridge/pages/mainpage.dart';

final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
void main() => runApp(ValueListenableBuilder(
    valueListenable: _notifier,
    builder: (_, mode, __) {
      return MaterialApp(
        theme: ThemeData(fontFamily: 'PTS'),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Paidwork-App',
        home: HomePage(),
        // routes: {
        //   '/': (context) => LoginPage(),

        // }
      );
    }));
