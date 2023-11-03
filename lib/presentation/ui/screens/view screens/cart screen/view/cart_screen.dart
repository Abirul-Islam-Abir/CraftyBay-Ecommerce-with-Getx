import '../../../../../../data/utils/export.dart';
import '../../../../widgets/bottom_details_card.dart';
import '../../../../widgets/normal_text.dart';
import '../../create invoice screen/controller/create_invoice_controller.dart';
import '../../home screen/component/cart_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.put(CartScreenController());
  final createInvoiceController = Get.put(CreateInvoiceController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavController>().goToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: Get.find<BottomNavController>().goToHome,
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          title: const NormalText('Cart'),
        ),
        body: GetBuilder<CartScreenController>(
          builder: (controller) =>controller.isLoading?const Center(child:CircularProgressIndicator()): Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartCard(
                          onTap: (){
                            Get.toNamed(RouteName.remarkProductDetails,
                                arguments:controller.cartList[index].productId);
                          },
                          img: controller.cartList[index].product!.image
                              .toString(),
                          removeBtn:(){
                            controller.decrement(  index);
                          },
                          addBtn:(){
                            controller.increment( index );
                          },
                          deletePress: () {
                            controller.showDeleteDialog(
                                controller.cartList[index].productId);
                          },
                          count: controller.countProduct.toString(),
                          title:
                              controller.cartList[index].product?.title ?? '',
                          price: controller.cartList[index].price.toString(),
                          colorText: controller.cartList[index].color ?? '',
                          sizeText: controller.cartList[index].size ?? '');
                      },
                      itemCount: controller.cartList.length)),
              GetBuilder<CartScreenController>(
                builder: (controller) => BottomDetailsCard(
                  isProgress: controller.isCheckout,
                  name: 'Check Out',
                  onPressed: () {Get.toNamed(RouteName.createInvoiceScreen);},
                  price: '${createInvoiceController.createInvoiceList[0].total }',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
