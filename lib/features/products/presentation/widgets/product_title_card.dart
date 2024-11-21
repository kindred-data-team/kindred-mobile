import 'package:flutter/material.dart';
import 'package:kindred_mobile/common/theme/theme_colors.dart';
import 'package:kindred_mobile/features/products/data/models/single_products_model.dart';

class ProductTitleCard extends StatefulWidget {
  final SingleProductsModel? product;
  const ProductTitleCard({super.key, required this.product});

  @override
  State<ProductTitleCard> createState() => _ProductTitleCardState();
}

class _ProductTitleCardState extends State<ProductTitleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        widget.product?.title ?? '',
                        style: const TextStyle(color: AppColors.textColor, fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '\$${widget.product?.price.toString() ?? ''}',
                      style: const TextStyle(color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Brand:${widget.product?.brand ?? ''}",
                        style: const TextStyle(color: AppColors.textColor, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '${widget.product?.stock ?? ''} in stock',
                      style: const TextStyle(color: AppColors.secondary, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
