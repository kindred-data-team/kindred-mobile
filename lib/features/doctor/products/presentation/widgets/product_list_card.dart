import 'package:flutter/material.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:kindred_app/features/doctor/products/data/models/product_list_model.dart';

class ProductListCard extends StatelessWidget {
  final ProductsListModel product;

  const ProductListCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Card(
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              shadowColor: Colors.black,
              color: AppColors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Image
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: double.infinity,
                    width: 120,
                    child: Center(
                      child: Image.network(
                        product.thumbnail ?? '',
                        width: 75,
                        height: 75,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //Desc
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title ?? '',
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$${product.price?.toString() ?? ''}',
                                style: const TextStyle(
                                    color: AppColors.secondaryColorOne,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                'Stock:${product.stock?.toString() ?? ''}',
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
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
          ),
          Positioned(
              top: 5,
              left: 0,
              child: Container(
                width: 65,
                height: 20,
                color: AppColors.secondaryColorOne,
                child: Center(
                  child: Text(
                    '${product.discountPercentage}% OFF',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
