import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/utils/time_utils.dart';

class ReadNewsScreen extends StatefulWidget {
  const ReadNewsScreen({Key? key, required this.params}) : super(key: key);
  final ReadNewsScreenParams params;

  @override
  State<ReadNewsScreen> createState() => _ReadNewsScreenState();
}

class _ReadNewsScreenState extends State<ReadNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: SvgPicture.asset(
              AppAsset.arrowLeft,
            ),
          ),
        ),
        title: TextRegular(
          'News',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.kAsh,
        ),
        centerTitle: true,
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Column(
            children: [
              HeaderText(
                widget.params.title,
              ),
              const Gap(10),
              CachedNetworkImage(
                height: 161,
                imageUrl: widget.params.image,
                imageBuilder: (
                  context,
                  imageProvider,
                ) {
                  return Container(
                    width: double.infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
                placeholder: (context, url) => Image.asset(
                  AppAsset.dark,
                  width: double.infinity,
                  height: 72,
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
              const Gap(67),
              LongText(
                widget.params.content,
                fontSize: 17,
                color: AppColors.kDarkWhite,
              ),
              const Gap(38),
              Column(
                children: [
                  TextBody(
                    TimeUtils.datePublished(widget.params.ago!),
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    color: AppColors.kDarkestAsh,
                  ),
                  const Gap(3),
                  TextBody(
                    widget.params.author,
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadNewsScreenParams {
  ReadNewsScreenParams({
    required this.title,
    required this.description,
    required this.author,
    required this.image,
    required this.ago,
    required this.content,
  });

  final String title;
  final String description;
  final String author;
  final String image;
  final DateTime? ago;
  final String content;
}
