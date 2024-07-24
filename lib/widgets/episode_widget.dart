import 'package:basic/models/webtoon_episode_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });
  final String webtoon_id;
  final WebtooneEpisodeModel episode;

  onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=${episode.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.green,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
