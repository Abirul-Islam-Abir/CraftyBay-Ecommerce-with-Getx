import 'package:shimmer/shimmer.dart';
import '../../theme/app_colors.dart';
import '../../utils/export.dart';

class CarouselSliderShimmer extends StatelessWidget {
  const CarouselSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 170,
      child: Shimmer.fromColors(
          baseColor: AppColor.shimmerBaseColor,
          highlightColor: AppColor.shimmerHighLightColor,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(kDefaultSize)),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kTextSize, vertical: kTextSize),
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(''),
                        SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.kWhiteColor,
                            ),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: AppColor.kPrimaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
