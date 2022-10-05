import 'package:flutter/material.dart';
import 'package:musica/screens/music_artist_screen.dart';
import 'package:musica/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: primaryColor,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(backgroundColor: primaryColor, elevation: 0)),
      home: const ArtistMusicScreen(),
    );
  }
}
