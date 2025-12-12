import 'package:flutter/material.dart';
import '../constants.dart';

class ViceScreen extends StatelessWidget {
  const ViceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ISIC Card Header
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: isicColor,
                image: DecorationImage(
                  image: AssetImage('assets/isic_bg.jpg'), // Replace with your background asset if available
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(isicColor.withOpacity(0.7), BlendMode.srcATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          'ISIC',
                          style: TextStyle(
                            color: isicColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INTERNATIONAL STUDENT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'IDENTITY CARD',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Profile Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your avatar asset
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tomas Soucek',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'tom.soucek@centrum.cz',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Upravit'),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Settings List
            Expanded(
              child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: ListView(
                children: [
                _ListTile(icon: Icons.location_on, title: 'Země', trailing: 'Denmark'),
                _ListTile(icon: Icons.language, title: 'Jazyk', trailing: 'Čeština'),
                _ListTile(icon: Icons.nightlight_round, title: 'Tmavý režim'),
                _ListTile(icon: Icons.credit_card, title: 'Zabezpečení průkazu'),
                _ListTile(icon: Icons.info_outline, title: 'O nás'),
                _ListTile(icon: Icons.support_agent, title: 'Podpora'),
                _ListTile(icon: Icons.local_offer, title: 'Navrhnout slevu'),
                _ListTile(icon: Icons.star, title: 'Ohodnoťte nás', noChevron: true),
                _ListTile(icon: Icons.logout, title: 'Odhlásit se', iconColor: isicColor, noChevron: true, lastItem: true),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Color? iconColor;
  final bool? noChevron;
  final bool? lastItem;

  const _ListTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.iconColor,
    this.noChevron = false,
    this.lastItem = false,
  });

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: iconColor ?? isicColor),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null)
                Text(trailing!, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              if (noChevron != true)
                const Icon(Icons.chevron_right, color: Color.fromARGB(255, 203, 203, 203)),
            ],
          ),
          onTap: () {},
        ),
        if (lastItem != true) const Divider(height: 1),
      ],
    );
  }
}
