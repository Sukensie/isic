import 'package:flutter/material.dart';
import 'package:isic_app/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        left: 16.0,
        right: 16.0,
        bottom: 60.0,
      ),
      color: isicColor,//todo: image background
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/tomas-face.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
          const SizedBox(width: 15),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Tomas Soucek',
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              ),
              Text(
                'University of Southern Denmark',
                style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                ),
              ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
