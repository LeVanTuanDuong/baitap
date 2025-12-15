import 'package:flutter/material.dart';
import 'product_detail.dart';

class Product {
  final String id;
  final String name;
  final String imagePath;
  final String price;
  final int sold;
  final double rating;
  final int reviews;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.sold,
    required this.rating,
    required this.reviews,
    this.description,
  });
}

class ShopMenu extends StatelessWidget {
  const ShopMenu({super.key});

  static final List<Product> products = [
    Product(
      id: '1',
      name: 'Bàn phím cơ Aluminum Mechanical Keyboard',
      imagePath: 'assets/images/pngtree-aluminum-mechanical-keyboard-image_16219086.jpg',
      price: '2.497.500',
      sold: 107,
      rating: 4.5,
      reviews: 120,
    ),
    Product(
      id: '2',
      name: 'Bàn phím cơ Filco Minila R Convertible',
      imagePath: 'assets/images/ban-phim-co-filco-minila-r-convertible.jpg.webp',
      price: '3.997.500',
      sold: 114,
      rating: 4.8,
      reviews: 85,
    ),
    Product(
      id: '3',
      name: 'Bàn phím cơ Gaming RGB LED',
      imagePath: 'assets/images/8620491_IMG-5650.jpg',
      price: '3.199.000',
      sold: 121,
      rating: 4.6,
      reviews: 200,
    ),
    Product(
      id: '4',
      name: 'Bàn phím cơ Razer Huntsman V3 Pro Mini 60',
      imagePath: 'assets/images/ban-phim-co-razer-huntsman-v3-pro-mini-60-analog-optical-rz03-04990100-r3m1-8.png.webp',
      price: '5.499.000',
      sold: 128,
      rating: 4.7,
      reviews: 156,
      description: 'TEXTURED DOUBLESHOT PBT KEYCAPS\nWith side-printed secondary functions',
    ),
    Product(
      id: '5',
      name: 'Bàn phím cơ Gaming Gravastar Mercury K1',
      imagePath: 'assets/images/ban-phim-co-gaming-gravastar-mercury-k1.jpg.webp',
      price: '2.799.000',
      sold: 135,
      rating: 4.4,
      reviews: 93,
    ),
    Product(
      id: '6',
      name: 'Bàn phím cơ Wireless Gaming Gravastar Mercury',
      imagePath: 'assets/images/75-wireless-mechanical-keyboard-for-pc-gaming-RGB-keebs-gravastar-mercury-k1-pro-002-500x500.jpg',
      price: '3.299.000',
      sold: 142,
      rating: 4.6,
      reviews: 178,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'TikTok',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Shop',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search, color: Colors.grey, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Tìm kiếm trên...',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  product.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            // Thông tin sản phẩm
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tên sản phẩm
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Giá
                    Text(
                      '₫${product.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    // Đã bán và đánh giá
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Đã bán ${product.sold}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.pink[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 2),
                        Text(
                          '${product.rating} (${product.reviews})',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
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

