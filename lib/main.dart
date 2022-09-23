import 'package:flutter/material.dart';
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
          backgroundColor: priamryColor,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(backgroundColor: priamryColor, elevation: 0)),
      home: const ArtistMusicScreen(),
    );
  }
}

class ArtistMusicScreen extends StatefulWidget {
  const ArtistMusicScreen({Key? key}) : super(key: key);

  @override
  State<ArtistMusicScreen> createState() => _ArtistMusicScreenState();
}

class _ArtistMusicScreenState extends State<ArtistMusicScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: priamryColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Stack(
              children: [
                SizedBox(
                  height: size.height / 3,
                  width: size.width,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(defaultRadius)),
                      child: Image.asset(
                        "assets/images/frank1.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 180,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Frank Ocean",
                            style: TextStyle(color: Colors.white)),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.green),
                          width: 120,
                          height: 45,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            child: Text(
                              "Follow",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
