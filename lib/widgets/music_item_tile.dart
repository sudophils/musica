import 'package:flutter/material.dart';

import '../models/music_model.dart';
import '../utils/constants.dart';

class MusicItemTile extends StatelessWidget {
  final MusicItemModel musicItemModel;
  final VoidCallback onTap;

  const MusicItemTile(
      {Key? key, required this.musicItemModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(musicItemModel.id,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w500)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 3),
            child: Material(
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
                subtitle: Text(musicItemModel.totalStreams),
                trailing: Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Image.asset("assets/icons/over_flow.png"),),
              ),
            ),
          ),
        )
      ],
    );
  }
}
