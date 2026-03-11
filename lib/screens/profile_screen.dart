
// ─────────────────────────────────────────────────────────────────
// screens/profile_screen.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _menuItems = [
    _MenuItem(Icons.bookmark_outline_rounded,   'Métiers sauvegardés',  'Retrouve tes favoris'),
    _MenuItem(Icons.history_rounded,             'Historique',           'Tes dernières consultations'),
    _MenuItem(Icons.notifications_none_rounded,  'Notifications',        'Alertes et rappels'),
    _MenuItem(Icons.help_outline_rounded,        'Aide & Support',       'FAQ et contact'),
    _MenuItem(Icons.logout_rounded,              'Se déconnecter',       '', isDestructive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Header ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5B6AF0), Color(0xFF8B7FF5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.4), width: 2),
                        ),
                        child: const Icon(Icons.person_rounded, size: 38, color: Colors.white),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Camille Martin',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: const Text(
                          'Élève · Orientation en cours',
                          style: TextStyle(fontSize: 13, color: Color(0xEEFFFFFF)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Stats row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatBox(value: '12', label: 'Métiers\nexplorés'),
                          _StatDivider(),
                          _StatBox(value: '5',  label: 'Écoles\nvues'),
                          _StatDivider(),
                          _StatBox(value: '3',  label: 'Favoris\nsauvegardés'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Menu ──────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            sliver: SliverList.list(
              children: [
                const Text(
                  'Mon compte',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textMuted),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    boxShadow: AppShadow.card,
                  ),
                  child: Column(
                    children: _menuItems.asMap().entries.map((e) {
                      final item = e.value;
                      final isLast = e.key == _menuItems.length - 1;
                      return Column(
                        children: [
                          _MenuTile(item: item),
                          if (!isLast)
                            const Divider(height: 1, indent: 58, color: AppColors.border),
                        ],
                      );
                    }).toList(),
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

class _StatBox extends StatelessWidget {
  const _StatBox({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Color(0xCCFFFFFF), height: 1.3),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36, color: Colors.white.withOpacity(0.25));
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.item});
  final _MenuItem item;

  @override
  Widget build(BuildContext context) {
    final color = item.isDestructive ? AppColors.red : AppColors.primary;
    final bgColor = item.isDestructive ? AppColors.redLight : AppColors.primaryLight;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Icon(item.icon, size: 18, color: color),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: item.isDestructive ? AppColors.red : AppColors.text,
        ),
      ),
      subtitle: item.subtitle.isNotEmpty
          ? Text(item.subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSub))
          : null,
      trailing: item.isDestructive
          ? null
          : const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 20),
      onTap: () {},
    );
  }
}

class _MenuItem {
  const _MenuItem(this.icon, this.title, this.subtitle, {this.isDestructive = false});
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDestructive;
}