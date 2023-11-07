import 'package:cached_network_image/cached_network_image.dart';
import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/create_invoice_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/payment%20screen/view/payment_screen.dart';

import '../../../../../../data/utils/export.dart';

class CreateInvoiceScreen extends StatelessWidget {
    CreateInvoiceScreen({super.key});
final controller = Get.put(CreateInvoiceController());


  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: AppBar(title: const Text('CheckOut Screen')),body:controller.createInvoiceList.isEmpty?const Text(''): ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
                Get.to(
                  () => PaymentScreen(
                    paymentUrl:
                        '${controller.createInvoiceList[0].paymentMethod![index].redirectGatewayURL}',
                    paymentName:
                        '${controller.createInvoiceList[0].paymentMethod![index].name}',
                  ),
                );
              },
              leading: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: AppColor.kPrimaryColor.shade50,
                    borderRadius: BorderRadius.circular(kSmallSize)),
                child: CachedNetworkImage(
                  imageUrl:
                      '${controller.createInvoiceList[0].paymentMethod![index].logo}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                    image: imageProvider, fit: BoxFit.fitWidth),
              ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.network(ImageAsset.shoes),
                ),
              ),
              subtitle: Text(
                  ' ${controller.createInvoiceList[0].paymentMethod![index].gw}'),
              title: Text(
                  ' ${controller.createInvoiceList[0].paymentMethod![index].name}'),
            );
          },
          itemCount: controller.createInvoiceList[0].paymentMethod?.length),
    );
  }
}
