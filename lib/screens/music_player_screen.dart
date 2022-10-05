import 'package:flutter/material.dart';
import 'package:musica/models/music_model.dart';
import 'package:musica/utils/constants.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicItemModel musicItem;

  const MusicPlayerScreen({Key? key, required this.musicItem})
      : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double _value = 32.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "NOW PLAYING",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Hero(
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  return Image.asset(
                    widget.musicItem.photoUrl,
                    fit: BoxFit.contain,
                  );
                },
                tag: widget.musicItem.id,
                child: Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  padding: const EdgeInsets.all(defaultPadding * 2),
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: size.width,
                  child: Image.asset(
                    widget.musicItem.photoUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: ListTile(
                    title: Text(widget.musicItem.musicTitle,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                    subtitle: Text(widget.musicItem.artistName),
                    trailing: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black26,
                    ),
                  ),
                ),
                Slider(
                    inactiveColor: Colors.black12,
                    activeColor: Colors.black,
                    min: 0.0,
                    max: 100.0,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_value.toStringAsFixed(2),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 12)),
                      Text("01:32",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(child: Image.asset("assets/icons/repeat.png")),
                    InkWell(
                        child: Image.asset("assets/icons/prev_btn_icon.png")),
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        maxRadius: 30,
                        child: Image.asset("assets/icons/pause.png"),
                      ),
                    ),
                    InkWell(
                        child: Image.asset("assets/icons/next_btn_icon.png")),
                    InkWell(child: Image.asset("assets/icons/shuffle.png")),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
