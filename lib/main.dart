import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/players_provider.dart';
import 'package:untitled/ui/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlayersListScreen(title: 'Players'),
      ),
    );
  }
}
