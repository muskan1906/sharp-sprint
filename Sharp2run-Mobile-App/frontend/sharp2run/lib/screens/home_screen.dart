import 'package:flutter/material.dart';
import 'challenge_screen.dart';
import 'wallet_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sharp2run Challenges")),
      body: Column(
        children: [
          ListTile(
            title: const Text("🔥 Daily Quiz Challenge"),
            subtitle: const Text("10-minute challenge"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChallengeScreen())),
          ),
          ElevatedButton(
            child: const Text("Wallet"),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WalletScreen())),
          ),
          ElevatedButton(
            child: const Text("Leaderboard"),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaderboardScreen())),
          ),
        ],
      ),
    );
  }
}
