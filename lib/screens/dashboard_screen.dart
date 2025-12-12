import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/id_status_card.dart';
import '../widgets/horizontal_section.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> newsItems;
  final List<Map<String, dynamic>> offerItems;

  const DashboardScreen({super.key, required this.newsItems, required this.offerItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add bottom margin to ProfileHeader for overlap
                Padding(
                  padding: const EdgeInsets.only(bottom: 36.0),
                  child: ProfileHeader(),
                ),
                // Add top margin to IdStatusCard for overlap effect
               
                const SizedBox(height: 20),
                HorizontalSection(title: 'Novinky', items: newsItems, isNews: true),
                const SizedBox(height: 20),
                HorizontalSection(title: 'Limitované nabídky', items: offerItems, isNews: false),
                const SizedBox(height: 20),
                HorizontalSection(title: 'Nové nabídky', items: offerItems, isNews: false),
                const SizedBox(height: 20),
                HorizontalSection(title: 'Nejlepší slevy', items: offerItems, isNews: false),
                const SizedBox(height: 20),
                HorizontalSection(title: 'Prozkoumejte své okolí', items: offerItems, isNews: false),
                const SizedBox(height: 20),
                HorizontalSection(title: 'Oblíbené', items: offerItems, isNews: false),
                const SizedBox(height: 20),
              ],
            ),
            // Overlap IdStatusCard on ProfileHeader
            Positioned(
              top: 100,
              left: 12,
              right: 12,
              child: IdStatusCard(),
            ),
          ],
        ),
      ),
    );
  }
}
