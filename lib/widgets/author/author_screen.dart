import 'package:flutter/material.dart';
import 'package:lab1_part1/config.dart';
import 'package:lab1_part1/constants.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(authorInfoTitleAndValue),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              appAuthorName,
              style: TextStyle(
                fontSize: fontSizeBig,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: paddingDefault),
            Text(
              appAuthorId.toString(),
              style: const TextStyle(
                fontSize: fontSizeBig,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
