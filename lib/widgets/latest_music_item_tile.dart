import 'package:flutter/material.dart';

import '../models/music_model.dart';
import '../utils/constants.dart';

class LatestMusicItemTile extends StatelessWidget {
  final MusicItemModel musicItemModel;
  final VoidCallback onTap;

  const LatestMusicItemTile(
      {Key? key, required this.musicItemModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 3),
      child: ListTile(
        onTap: onTap,
        leading: SizedBox(
          width: 63,
          height: 68,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                musicItemModel.photoUrl,
                fit: BoxFit.cover,
              )),
        ),
        title: Text(musicItemModel.musicTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(musicItemModel.totalStreams,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.w400)),
            Text(musicItemModel.releaseDate ?? "2022",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300)),
          ],
        ),
        trailing: Image.asset("assets/icons/over_flow.png"),
      ),
    );
  }
}
