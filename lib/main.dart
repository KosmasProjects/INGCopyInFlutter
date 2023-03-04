import 'package:flutter/material.dart';
import 'package:fridge/pages/loginpage.dart';

// void main() {
//   runApp(const MyApp());
// }
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
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
