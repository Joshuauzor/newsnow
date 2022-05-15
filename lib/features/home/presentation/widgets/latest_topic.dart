import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/constant/fonts.dart';
import 'package:newsnow/core/core.dart';

class Latestnews extends StatelessWidget {
  const Latestnews({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.ago,
    required this.source,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String ago;
  final String source;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (
            context,
            imageProvider,
          ) {
            return Container(
              width: double.infinity,
              height: 96,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
          placeholder: (context, url) => Image.asset(
            AppAsset.dark,
            width: double.infinity,
            height: 96,
          ),
          errorWidget: (
            context,
            url,
            error,
          ) =>
              Image.asset(
            AppAsset.dark,
          ),
        ),
        const Gap(8),
        TextRegular(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.playFair,
        ),
        const Gap(16),
        Row(
          children: [
            TextRegular(
              ago,
              fontSize: 8,
            ),
            const Gap(16),
            TextRegular(
              source,
              fontSize: 8,
            ),
          ],
        ),
      ],
    );
  }
}
