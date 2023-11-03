import 'package:crafty_bay_ecommerce/data/model/10%20invoice/create_invoice_model.dart';
import 'package:crafty_bay_ecommerce/data/model/9%20cart%20list/cart_list_model.dart';
import 'package:crafty_bay_ecommerce/data/services/10%20invoice/create_invoice.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class CreateInvoiceController extends GetxController {
 bool _isLoading = true;
 bool get isLoading =>_isLoading;
final List<CreateInvoiceModel> _createInvoiceList = [];
 List<CreateInvoiceModel> get createInvoiceList=>_createInvoiceList;
 Future fetchAndParseCreateInvoice()async{
 List<Map<String,dynamic>> response = await fetchCreateInvoiceRequest();
 print(response);
  _createInvoiceList.clear();
   _createInvoiceList.addAll(response.map((json) =>CreateInvoiceModel.fromJson(json) ));
 }



}