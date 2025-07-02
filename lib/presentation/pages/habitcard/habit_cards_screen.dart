import 'package:flutter/material.dart';

class HabitCardsScreen extends StatelessWidget {
  const HabitCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(Icons.arrow_back_ios_new, onTap: () {
                    Navigator.pop(context);
                  }),
                  _circleIcon(Icons.share_outlined, onTap: () {}),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Create a new habit",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _HabitTypeCard(icon: Icons.repeat, label: "Regular"),
                  _HabitTypeCard(icon: Icons.arrow_downward, label: "Negative"),
                  _HabitTypeCard(icon: Icons.assignment, label: "One Task"),
                ],
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7FFA88), Color(0xFF4CE072)],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '+ Create your own',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _HabitTrendCard(),
              const SizedBox(height: 16),
              _HabitTrendCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: const Color(0xFF1A1A1A),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _HabitTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HabitTypeCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF3D3D3D),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _HabitTrendCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161816),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF3D3D3D),
            child: Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Habits in trend",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Lorem ipsum dummy text",
                    style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child:
                const Icon(Icons.arrow_outward, color: Colors.white, size: 18),
          )
        ],
      ),
    );
  }
}
