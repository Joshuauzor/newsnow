import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newsnow/app/styles/fonts.dart';
import 'package:newsnow/core/constant/fonts.dart';
import 'package:newsnow/core/core.dart';
import 'package:newsnow/core/extensions/context_extensions.dart';

class Hottopics extends StatelessWidget {
  const Hottopics({
    Key? key,
    required this.title,
    required this.ago,
    required this.source,
    this.image = '',
  }) : super(key: key);

  final String title;
  final String ago;
  final String source;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image ?? ''),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextRegular(
                title,
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.playFair,
              ),
              const Gap(8),
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
          ),
        ),
      ),
    );
  }
}
