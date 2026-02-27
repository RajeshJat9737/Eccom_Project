import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Favorite"),
      ),
    );
  }
}
