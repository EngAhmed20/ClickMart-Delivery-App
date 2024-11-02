class UserModel {
  int? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  int? deliveryVerifycode;
  int? deliveryApprove;
  String? deliveryCreate;
  String? deliveryPassword;

  UserModel(
      {this.deliveryId,
        this.deliveryName,
        this.deliveryEmail,
        this.deliveryPhone,
        this.deliveryVerifycode,
        this.deliveryApprove,
        this.deliveryCreate,
        this.deliveryPassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPhone = json['delivery_phone'];
    deliveryVerifycode = json['delivery_verifycode'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreate = json['delivery_create'];
    deliveryPassword = json['delivery_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_verifycode'] = this.deliveryVerifycode;
    data['delivery_approve'] = this.deliveryApprove;
    data['delivery_create'] = this.deliveryCreate;
    data['delivery_password'] = this.deliveryPassword;
    return data;
  }
}