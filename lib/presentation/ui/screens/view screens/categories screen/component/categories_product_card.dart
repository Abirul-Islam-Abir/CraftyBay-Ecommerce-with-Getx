import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../data/utils/export.dart';

class CategoriesProductCard extends StatelessWidget {
  const CategoriesProductCard({
    super.key,
    this.onTap,
    required this.img,
    required this.categoryName,
  });

  final Function()? onTap;
  final String img;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              width: Get.width / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kTooSmallSize),
                color: AppColor.kPrimaryColor.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSmallSize),
                child: CachedNetworkImage(
                  imageUrl: img,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fitWidth),
                    ),
                    height: 50,
                    width: 50,
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.network(
                    ImageAsset.noImageNet,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          categoryName,
          style: const TextStyle(
              color: AppColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: kSmallSize),
        )
      ],
    );
  }
}
