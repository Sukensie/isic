import 'package:flutter/material.dart';
import 'package:isic_app/constants.dart';

class IdStatusCard extends StatelessWidget {
  const IdStatusCard({super.key});


  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final expiry = DateTime(2026, 12, 8);
    final days = expiry.difference(now).inDays;
    return Card(
      color: const Color(0xFFF9F9F9),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Color(0xFFEDF1F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Číslo průkazu',
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: const [
                        Text(
                          'S045001008934Q',
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.copy, size: 16, color: isicColor),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Končící platnost karty',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        Text(
                          'Za $days dní',
                          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.keyboard_arrow_right, color: Color(0xFFD5D5D5), size: 24),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
