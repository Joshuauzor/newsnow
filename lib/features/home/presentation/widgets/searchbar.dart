import 'package:flutter/material.dart';
import 'package:newsnow/core/constant/fonts.dart';
import 'package:newsnow/core/core.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search for news',
          hintStyle: TextStyle(
            fontFamily: AppFonts.roboto,
            fontSize: 12,
            color: AppColors.primaryColor,
          ),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
