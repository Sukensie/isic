import 'package:flutter/material.dart';
import 'package:isic_app/constants.dart';
import 'content_card.dart';

class HorizontalSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final bool isNews;

  const HorizontalSection({
    super.key,
    required this.title,
    required this.items,
    required this.isNews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isicColor),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Více >',
                  style: TextStyle(color: darkGray, fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            // Diagonal divider
            
            // Content list with top margin to overlap the diagonal
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: isNews ? 250 : 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(width: 16);
                    }
                    final item = items[index - 1];
                    return ContentCard(
                      item: item,
                      isNews: isNews,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(DiagonalClipper oldClipper) => false;
}
