import 'package:flutter/material.dart';

class ClassroomMenu extends StatelessWidget {
  const ClassroomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Classroom',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCourseCard(
            title: 'XML và ứng dụng - Nhóm 1',
            courseId: '2025-2026.1.TIN4583.001',
            students: 58,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: Colors.grey[900]!,
            imagePath: 'assets/images/class1.jpg',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 6',
            courseId: '2025-2026.1.TIN4403.006',
            students: 55,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: Colors.grey[900]!,
            imagePath: 'assets/images/class2.jpg',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 5',
            courseId: '2025-2026.1.TIN4403.005',
            students: 52,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: Colors.grey[900]!,
            imagePath: 'assets/images/class3.jpg',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 4',
            courseId: '2025-2026.1.TIN4403.004',
            students: 50,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: const Color(0xFF1a237e),
            imagePath: 'assets/images/class4.jpg',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 3',
            courseId: '2025-2026.1.TIN4403.003',
            students: 48,
            hasStar: true,
            hasDocument: false,
            hasDots: false,
            backgroundColor: Colors.grey[900]!,
            imagePath: 'assets/images/class5.webp',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 2',
            courseId: '2025-2026.1.TIN4403.002',
            students: 45,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: Colors.grey[900]!,
            imagePath: 'assets/images/class1.jpg',
          ),
          const SizedBox(height: 12),
          _buildCourseCard(
            title: 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 1',
            courseId: '2025-2026.1.TIN4403.001',
            students: 42,
            hasStar: false,
            hasDocument: false,
            hasDots: false,
            backgroundColor: const Color(0xFF1a237e),
            imagePath: 'assets/images/class2.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String courseId,
    required int students,
    required bool hasStar,
    required bool hasDocument,
    required bool hasDots,
    Color? backgroundColor,
    String? imagePath,
  }) {
    return Container(
      height: 162, // Chiều cao cố định cho tất cả các card
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Hình ảnh phủ toàn bộ khung
            if (imagePath != null)
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: backgroundColor ?? Colors.grey[900]!,
                    );
                  },
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  gradient: backgroundColor == null
                      ? const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1a1a1a), Color(0xFF1a237e)],
                        )
                      : null,
                  color: backgroundColor,
                ),
              ),
            // Lớp overlay màu đen mờ để text dễ đọc
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
            // Nội dung card
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Icon 3 chấm ở góc phải, cùng hàng với tên
                          IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 20,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              // Xử lý khi nhấn icon 3 chấm
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 0),
                      Text(
                        courseId,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: Colors.white.withOpacity(0.9),
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$students học viên',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      if (hasDocument || hasDots || hasStar)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (hasStar)
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24,
                              ),
                            if (hasDots) ...[
                              if (hasStar) const SizedBox(height: 4),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                            if (hasDocument)
                              const Icon(
                                Icons.description,
                                color: Colors.yellow,
                                size: 24,
                              ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
