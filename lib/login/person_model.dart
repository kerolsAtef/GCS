
class Person {
  String id;
  String eMailAddress1;
  String blsPassword;
  String firstName;
  String lastName;
  String mobilePhone;
  String parentCustomerIdName;
  String parentCustomerId;
  dynamic taxNo;
  dynamic tradeNo;
  String governorateName;
  String address;

  Person({
    required this.id,
    required this.eMailAddress1,
    required this.blsPassword,
    required this.firstName,
    required this.lastName,
    required this.mobilePhone,
    required this.parentCustomerIdName,
    required this.parentCustomerId,
    required this.taxNo,
    required this.tradeNo,
    required this.governorateName,
    required this.address,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["Id"],
    eMailAddress1: json["EMailAddress1"]??" ",
    blsPassword: json["bls_Password"]??" ",
    firstName: json["FirstName"]??" ",
    lastName: json["LastName"]??" ",
    mobilePhone: json["MobilePhone"]??" ",
    parentCustomerIdName: json["ParentCustomerIdName"]??" ",
    parentCustomerId: json["ParentCustomerId"]??" ",
    taxNo: json["TaxNo"]??" ",
    tradeNo: json["TradeNo"]??" ",
    governorateName: json["GovernorateName"]??" ",
    address: json["Address"]??" ",
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "EMailAddress1": eMailAddress1,
    "bls_Password": blsPassword,
    "FirstName": firstName,
    "LastName": lastName,
    "MobilePhone": mobilePhone,
    "ParentCustomerIdName": parentCustomerIdName,
    "ParentCustomerId": parentCustomerId,
    "TaxNo": taxNo,
    "TradeNo": tradeNo,
    "GovernorateName": governorateName,
    "Address": address,
  };
}
