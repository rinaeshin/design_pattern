import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/patterns.dart';
import '../models/design_pattern.dart';

class PatternDetailPage extends StatefulWidget {
  final DesignPattern pattern;

  const PatternDetailPage({Key? key, required this.pattern}) : super(key: key);

  @override
  _PatternDetailPageState createState() => _PatternDetailPageState();
}

class _PatternDetailPageState extends State<PatternDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pattern.name)),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showCodeDialog(context),
          child: const Text('Show Code'),
        ),
      ),
    );
  }

  void _showCodeDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    Widget content(BuildContext ctx) {
      return SizedBox(
        width: isMobile ? double.infinity : 800,
        height: isMobile ? MediaQuery.of(context).size.height * 0.8 : 600,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                  const SizedBox(width: 8),
                  const Text('Code Viewer', style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 16), // Add vertical spacing
              Expanded(
                child: SingleChildScrollView(
                  child: SelectableText(
                    widget.pattern.exampleCode,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: widget.pattern.exampleCode),
                  );
                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('코드가 클립보드에 복사되었습니다')),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copy'),
              ),
            ],
          ),
        ),
      );
    }

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => content(ctx),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => Dialog(
          insetPadding: const EdgeInsets.all(24.0),
          child: content(ctx),
        ),
      );
    }
  }
}
