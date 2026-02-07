import 'package:flutter/material.dart';
import 'package:musa/presentation/widget/customCard.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          'Favoriates Page ',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
