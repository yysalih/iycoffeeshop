import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(Icons.favorite, color: Colors.redAccent, size: 25,),
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder()
      ),
    );
  }
}
