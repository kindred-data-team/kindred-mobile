import 'package:flutter/material.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:kindred_mobile/features/products/data/models/single_products_model.dart';

class ProductDescriptionCard extends StatelessWidget {
  final SingleProductsModel? product;
  const ProductDescriptionCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 470,
        width: double.infinity,
        child: Card(
          color: AppColors.primary,
          elevation: 10,
          shadowColor: Colors.black,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Item Description',
                  style: TextStyle(color: AppColors.secondary, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Desc
                const Text(
                  '• Description',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product?.description ?? '',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                //Category
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Category',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.category ?? ''}',
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                //dimensions
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Dimensions (mm)',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.dimensions?.width}x${product?.dimensions?.height}x${product?.dimensions?.depth}',
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Warranty Information',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.warrantyInformation ?? ''}',
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Shipping Information',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.shippingInformation ?? ''}',
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                //warranty info
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '• Return Policy',
                  style: TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ' -${product?.returnPolicy ?? ''}',
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ));
  }
}
