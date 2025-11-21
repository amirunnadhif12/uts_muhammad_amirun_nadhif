import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/auth_controller.dart';
import 'controller/obat_controller.dart';
import 'controller/transaksi_controller.dart';
import 'database/local_storage.dart';
import 'view/auth/welcome_page.dart';
import 'view/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ObatController()),
        ChangeNotifierProvider(create: (_) => TransaksiController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apotek UTS',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const WelcomePage(),
        routes: {
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
