import 'package:flutter/material.dart';
import 'controller.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  var controller = JournalController();
  String keyword = '';

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await controller.load();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF7F3EA),
    appBar: AppBar(
      backgroundColor: const Color(0xFFF7F3EA),
      title: const Text(
        '小さな幸せ集',
        style: TextStyle(
          color: Color(0xFF493F36),
          fontSize: 28,
          fontFamily: 'serif',
        ),
      ),
    ),
    body: Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: '共感を探す',
            hintStyle: TextStyle(color: Color(0xFF493F36)),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFFD98A45),
            ),
            contentPadding: EdgeInsets.all(16),
          ),
          onChanged: (s) => setState(() => keyword = s),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var p in controller.search(keyword))
                ListTile(
                  leading: Text(
                    p['emoji'],
                    style: const TextStyle(fontSize: 32),
                  ),
                  title: Text(
                    p['user'],
                    style: const TextStyle(
                      color: Color(0xFFD98A45),
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                    p['text'],
                    style: const TextStyle(
                      color: Color(0xFF493F36),
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}