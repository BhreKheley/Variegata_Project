import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  String image, title, price;
  ProductCard(
      {required this.image,
      required this.title,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 231,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(5),
            ),
            child: Image(
              image: AssetImage('assets/img/$image'),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 110,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  price.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFFBBD6B8),
                      size: 15,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Kudus',
                      style: TextStyle(
                          color: Color(0xFFADADAD),
                          fontSize: 9,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFC400),
                      size: 10,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '4.9 | Terjual 14',
                      style: TextStyle(
                          color: Color(0xFFADADAD),
                          fontSize: 9,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_horiz,
                color: Color(0xFFADADAD),
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
