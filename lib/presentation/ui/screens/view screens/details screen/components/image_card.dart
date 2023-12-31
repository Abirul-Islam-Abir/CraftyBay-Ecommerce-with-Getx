import '../../../../../../data/utils/export.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.productDetails,
  });

  final List<ProductDetailsModel> productDetails;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemarkProductDetailsScreenController>(builder: (controller) {
      return Container(
        width: Get.width,
        height: Get.height / 3,
        decoration: BoxDecoration(
          color: AppColor.kGreyColor.withOpacity(0.1),
        ),
        child: Stack(
          children: [
            PageView(
              onPageChanged: controller.imageSelect,
              children: [
                Image.network(
                  productDetails[0].img1.toString(),
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    ImageAsset.noImageNet,
                    height: 300,
                    width: Get.width / 3,
                  ),
                ),
                Image.network(
                  productDetails[0].img2.toString(),
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    ImageAsset.noImageNet,
                    height: 300,
                    width: Get.width / 3,
                  ),
                ),
                Image.network(
                  productDetails[0].img3.toString(),
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    ImageAsset.noImageNet,
                    height: 300,
                    width: Get.width / 3,
                  ),
                ),
                Image.network(
                  productDetails[0].img4.toString(),
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    ImageAsset.noImageNet,
                    height: 300,
                    width: Get.width / 3,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 50,
              right: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: controller.imageIndex == index
                                ? AppColor.kRedColor
                                : AppColor.kPrimaryColor,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
