import 'package:flutter/material.dart';
import 'package:newsnow/app/styles/fonts.dart';

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
        title: TextRegular(
          'News',
          fontSize: 20,
          fontWeight: FontWeight.w500,
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
  });

  final String title;
  final String description;
  final String author;
  final String image;
  final String ago;
}
