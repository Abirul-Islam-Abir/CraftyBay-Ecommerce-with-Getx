class CreateInvoiceModel {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  CreateInvoiceModel({this.paymentMethod, this.payable, this.vat, this.total});

  CreateInvoiceModel.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(new PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] =
          this.paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = this.payable;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}

class PaymentMethod {
  String? name;
  String? type;
  String? logo;
  String? gw;
  String? rFlag;
  String? redirectGatewayURL;

  PaymentMethod(
      {this.name,
        this.type,
        this.logo,
        this.gw,
        this.rFlag,
        this.redirectGatewayURL});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
    gw = json['gw'];
    rFlag = json['r_flag'];
    redirectGatewayURL = json['redirectGatewayURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['logo'] = this.logo;
    data['gw'] = this.gw;
    data['r_flag'] = this.rFlag;
    data['redirectGatewayURL'] = this.redirectGatewayURL;
    return data;
  }
}
