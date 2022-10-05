import 'package:flutter/material.dart';
import 'package:musica/screens/music_player_screen.dart';
import 'package:musica/widgets/latest_music_item_tile.dart';

import '../data/music_data.dart';
import '../utils/constants.dart';
import '../widgets/music_item_tile.dart';

class ArtistMusicScreen extends StatefulWidget {
  const ArtistMusicScreen({Key? key}) : super(key: key);

  @override
  State<ArtistMusicScreen> createState() => _ArtistMusicScreenState();
}

class _ArtistMusicScreenState extends State<ArtistMusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            artistCardStack(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    "Popular",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    "See more",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                )
              ],
            ),
            ...musicList.map((music) => Hero(
                  flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                  ) {
                    return Image.asset(
                      music.photoUrl,
                      fit: BoxFit.cover,
                    );
                  },
                  tag: music.id,
                  child: MusicItemTile(
                    musicItemModel: music,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MusicPlayerScreen(musicItem: music)));
                      print(music.totalStreams);
                    },
                  ),
                )),
            const SizedBox(
              height: defaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: 24),
              child: Text(
                textAlign: TextAlign.left,
                "Latest Release",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.w900, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            LatestMusicItemTile(musicItemModel: musicList[4], onTap: () {})
          ],
        ),
      ),
    );
  }

  Widget artistCardStack() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      child: Stack(
        children: [
          SizedBox(
            height: size.height / 3,
            width: size.width,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultRadius)),
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
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Frank Ocean",
                      style: TextStyle(color: Colors.white)),
                  InkWell(
                    onTap: () {
                      print("Followed");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.green),
                      width: size.width / 5,
                      height: 40,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
