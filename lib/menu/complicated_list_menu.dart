import 'package:flutter/material.dart';

class ComplicatedListMenu extends StatelessWidget {
  const ComplicatedListMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    final bottomHeight = 30.0; // Chiều cao phần bottom của AppBar
    // Vị trí để khung đè lên đường ngăn cách (cuối AppBar)
    final overlayTop = statusBarHeight + appBarHeight + bottomHeight - 30;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              'Complicated list',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              // Tab bar
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem('Sắp xếp', Icons.swap_vert, hasRedDot: true),
                    _buildTabItem('Lọc', Icons.tune),
                    _buildTabItem('Bản đồ', Icons.map),
                  ],
                ),
              ),
              // Nội dung - Danh sách chỗ nghỉ
              Expanded(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '757 chỗ nghỉ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    // Danh sách chỗ nghỉ
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          _buildAccommodationCard(
                            imageUrl: 'assets/images/complicated1.jpg',
                            badge: 'Bao bữa sáng',
                            name: 'aNhill Boutique',
                            rating: 9.5,
                            ratingText: 'Xuất sắc',
                            reviewCount: 95,
                            location: 'Huế - Cách bạn 0,6km',
                            details: '1 suite riêng tư: 1 giường',
                            price: 'US\$109',
                            hasStars: true,
                            starCount: 5,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          _buildAccommodationCard(
                            imageUrl: 'assets/images/cplic2.jpg',
                            badge: 'Bao bữa sáng',
                            name: 'An Nam Hue Boutique',
                            rating: 9.2,
                            ratingText: 'Tuyệt hảo',
                            reviewCount: 34,
                            location: 'Cư Chinh - Cách bạn 0,9km',
                            details: '1 phòng khách sạn: 1 giường',
                            price: 'US\$20',
                            hasStars: false,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          _buildAccommodationCard(
                            imageUrl: 'assets/images/complic3.jpg',
                            badge: null,
                            name: 'Huế Jade Hill Villa',
                            management: 'Được quản lý bởi một host cá nhân',
                            rating: 8.0,
                            ratingText: 'Rất tốt',
                            reviewCount: 1,
                            location: 'Cư Chinh - Cách bạn 1,3km',
                            details:
                                '1 biệt thự nguyên căn – 1.000 m²: 4 giường - 3 phòng ngủ - 1 phòng khách - 3 phòng tắm',
                            price: 'US\$285',
                            hasStars: false,
                            specialOffer:
                                'Chỉ còn 1 căn với giá này trên Booking.com',
                            paymentOption: 'Không cần thanh toán trước',
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          _buildAccommodationCard(
                            imageUrl: 'assets/images/complic4.jpg',
                            badge: 'Bao bữa sáng',
                            name: 'Êm Villa',
                            rating: 8.5,
                            ratingText: 'Rất tốt',
                            reviewCount: 12,
                            location: 'Huế • Cách bạn 2,1km',
                            details: '1 biệt thự nguyên căn: 3 giường',
                            price: 'US\$150',
                            hasStars: true,
                            starCount: 4,
                          ),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          _buildAccommodationCard(
                            imageUrl: 'assets/images/dia-diem-Hallstatt.jpg',
                            badge: 'Bao bữa sáng',
                            name: 'La Residence Hue Hotel',
                            rating: 9.0,
                            ratingText: 'Tuyệt hảo',
                            reviewCount: 234,
                            location: 'Huế • Cách bạn 1,5km',
                            details: '1 phòng khách sạn: 1 giường',
                            price: 'US\$85',
                            hasStars: true,
                            starCount: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Khung đè lên cả AppBar và đường ngăn cách
        Positioned(
          left: 8,
          top: overlayTop,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange, width: 1.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.chevron_left, color: Colors.black, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Xung quanh vị trí hiện tại',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '23 thg 10 – 24 thg 10',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(String title, IconData icon, {bool hasRedDot = false}) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(icon, color: Colors.black87, size: 20),
                  if (hasRedDot)
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccommodationCard({
    required String imageUrl,
    String? badge,
    required String name,
    String? management,
    double? rating,
    String? ratingText,
    int? reviewCount,
    String? location,
    String? details,
    String? price,
    required bool hasStars,
    int starCount = 5,
    String? specialOffer,
    String? paymentOption,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hình ảnh
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imageUrl.isNotEmpty
                    ? Image.asset(
                        imageUrl,
                        width: 120,
                        height: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image,
                              color: Colors.grey[400],
                              size: 40,
                            ),
                          );
                        },
                      )
                    : Icon(Icons.image, color: Colors.grey[400], size: 40),
              ),
            ),
            // Badge "Bao bữa sáng"
            if (badge != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        // Thông tin
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tên và icon tim
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(8, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black87,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              // Management
              if (management != null) ...[
                const SizedBox(height: 4),
                Text(
                  management,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
              const SizedBox(height: 8),
              // Rating
              if (rating != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasStars)
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < starCount ? Icons.star : Icons.star_border,
                            color: Colors.yellow[700],
                            size: 14,
                          ),
                        ),
                      ),
                    if (hasStars) const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '$rating',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$ratingText - $reviewCount đánh giá',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (rating == null && !hasStars) const SizedBox(height: 8),
              // Location
              if (location != null) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
              // Details
              if (details != null) ...[
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    details,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              // Price và thông tin
              if (price != null) ...[
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Đã bao gồm thuế và phí',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
              // Special offer
              if (specialOffer != null) ...[
                const SizedBox(height: 6),
                Text(
                  specialOffer,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              // Payment option
              if (paymentOption != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Colors.green[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      paymentOption,
                      style: TextStyle(fontSize: 12, color: Colors.green[700]),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
