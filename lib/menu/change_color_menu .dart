import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({super.key});

  @override
  State<ChangeColorPage> createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  Color _backgroundColor = Colors.white;
  String _colorName = 'Trắng';

  // Map màu và tên tiếng Việt
  final Map<Color, String> _colorNames = {
    Colors.white: 'Trắng',
    Colors.red: 'Đỏ',
    Colors.blue: 'Xanh dương',
    Colors.green: 'Xanh lá',
    Colors.yellow: 'Vàng',
    Colors.orange: 'Cam',
    Colors.purple: 'Tím',
    Colors.pink: 'Hồng',
    Colors.brown: 'Nâu',
    Colors.grey: 'Xám',
    Colors.teal: 'Xanh ngọc',
    Colors.cyan: 'Xanh lơ',
    Colors.indigo: 'Chàm',
    Colors.amber: 'Hổ phách',
    Colors.lime: 'Xanh chanh',
    Colors.deepPurple: 'Tím đậm',
    Colors.deepOrange: 'Cam đậm',
    Colors.lightBlue: 'Xanh dương nhạt',
    Colors.lightGreen: 'Xanh lá nhạt',
    Colors.blueGrey: 'Xanh xám',
  };

  void _changeColor() {
    final random = Random();
    final colors = _colorNames.keys.toList();
    final newColor = colors[random.nextInt(colors.length)];

    setState(() {
      _backgroundColor = newColor;
      _colorName = _colorNames[newColor] ?? 'Không xác định';
    });
  }

  void _resetColor() {
    setState(() {
      _backgroundColor = Colors.white;
      _colorName = 'Trắng';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black87),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Background Color',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text "Màu hiện tại"
              const Text(
                'Màu hiện tại',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 12),
              // Text tên màu (lớn, đậm)
              Text(
                _colorName,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              // 2 nút: Đổi màu và Đặt lại
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nút Đổi màu
                  InkWell(
                    onTap: _changeColor,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Color(0xFF1a237e), // Xanh dương sẩm
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.format_paint,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Đổi màu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Nút Đặt lại
                  InkWell(
                    onTap: _resetColor,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Color(0xFF1a237e), // Xanh dương sẩm
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Đặt lại',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
