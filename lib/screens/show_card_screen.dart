import 'package:flutter/material.dart';
import 'package:isic_app/constants.dart';

class ShowCardScreen extends StatefulWidget {
  const ShowCardScreen({super.key});

  @override
  State<ShowCardScreen> createState() => _ShowCardScreenState();
}

class _ShowCardScreenState extends State<ShowCardScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> cardImages = [
    'assets/1-card_vertical.jpg',
    'assets/1-card_front.jpg',
    'assets/card_back.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Top bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('PLATNÝ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
                      const Spacer(),
                      StreamBuilder<DateTime>(
                        stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
                        builder: (context, snapshot) {
                          final now = snapshot.data ?? DateTime.now();
                          return Text(
                            '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Card area with swipe
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cardImages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CardImageWidget(imagePath: cardImages[index]),
                    );
                  },
                ),
              ),
              // Dot indicator
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: DotIndicator(currentIndex: _currentPage, count: cardImages.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardImageWidget extends StatelessWidget {
  final String imagePath;
  const CardImageWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
      const double cardHeight = 700;
      const double cardWidth = 450;
      return Center(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: cardWidth,
                  height: cardHeight,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/watermark-new.gif',
                  fit: BoxFit.cover,
                  width: cardWidth,
                  height: cardHeight,
                  opacity: AlwaysStoppedAnimation(1),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;
  const DotIndicator({required this.currentIndex, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: index == currentIndex ? isicColor : Colors.grey[400],
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        const Text('Procházení stránek', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
