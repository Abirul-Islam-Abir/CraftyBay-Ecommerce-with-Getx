import 'package:crafty_bay_ecommerce/data/model/10%20invoice/create_invoice_model.dart';
import 'package:crafty_bay_ecommerce/data/services/10%20invoice/create_invoice.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController {
final List<CreateInvoiceModel> _createInvoiceList = [];
 List<CreateInvoiceModel> get createInvoiceList=>_createInvoiceList;
 Future fetchAndParseCreateInvoice()async{
 List<Map<String,dynamic>> response = await fetchCreateInvoiceRequest();
  _createInvoiceList.clear();
   _createInvoiceList.addAll(response.map((json) =>CreateInvoiceModel.fromJson(json) ));
 }



}