import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/time_utils.dart';
import 'package:newsnow/features/features.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({
    required this.title,
    required this.description,
    required this.author,
    required this.image,
    required this.ago,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final String author;
  final String image;
  final DateTime ago;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.readNews,
                arguments: ReadNewsScreenParams(
                  title: title,
                  description: description,
                  author: author,
                  image: image,
                  ago: ago,
                  content: content,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRegular(
                  title,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kAsh,
                ),
                const Gap(9),
                TextBody(
                  description,
                  fontSize: 14,
                  color: AppColors.kDarkerAsh,
                ),
                const Gap(20),
                Row(
                  children: [
                    TextBody(
                      '${TimeUtils.ago(ago)} ago',
                      fontSize: 12,
                      color: AppColors.kDarkestAsh,
                    ),
                    const Gap(16),
                    TextBody(
                      author,
                      fontSize: 12,
                      color: AppColors.kDarkestAsh,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Gap(5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (
                context,
                imageProvider,
              ) {
                return Container(
                  width: 118,
                  height: 132,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
              placeholder: (context, url) => Image.asset(
                AppAsset.dark,
                width: 118,
                height: 132,
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
            const Gap(18),
            Row(
              children: [
                SvgPicture.asset(AppAsset.share),
                const Gap(34.7),
                SvgPicture.asset(AppAsset.pocket),
              ],
            ),
          ],
        )
      ],
    );
  }
}
