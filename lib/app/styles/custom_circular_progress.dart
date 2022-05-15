import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsnow/core/core.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator(
            radius: 15,
            color: AppColors.white,
          )
        : const CircularProgressIndicator(
            color: AppColors.white,
            backgroundColor: AppColors.white,
          );
  }
}
