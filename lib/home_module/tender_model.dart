

class Tenders {
  int? totalCount;
  int? pageSize;
  int? page;
  List<Tender>? tenders;
  dynamic filterGovEntity;
  dynamic filterStartDate;
  dynamic filterEndDate;
  dynamic filterKindValue;

  Tenders({
    required this.totalCount,
    required this.pageSize,
    required this.page,
    required this.tenders,
    required this.filterGovEntity,
    required this.filterStartDate,
    required this.filterEndDate,
    required this.filterKindValue,
  });

  factory Tenders.fromJson(Map<String, dynamic> json) => Tenders(
    totalCount: json["TotalCount"],
    pageSize: json["PageSize"],
    page: json["Page"],
    tenders: json["Tenders"] ==null?[]: List<Tender>.from(json["Tenders"].map((x) => Tender.fromJson(x))),
    filterGovEntity: json["FilterGovEntity"],
    filterStartDate: json["FilterStartDate"],
    filterEndDate: json["FilterEndDate"],
    filterKindValue: json["FilterKindValue"],
  );

  Map<String, dynamic> toJson() => {
    "TotalCount": totalCount,
    "PageSize": pageSize,
    "Page": page,
    "Tenders": tenders ==null?null:List<dynamic>.from(tenders!.map((x) => x.toJson())),
    "FilterGovEntity": filterGovEntity,
    "FilterStartDate": filterStartDate,
    "FilterEndDate": filterEndDate,
    "FilterKindValue": filterKindValue,
  };
}

class Tender {
  String id;
  String etenderRefno;
  String blsRequestingBodyName;
  BlsTenderFiscalYearName blsTenderFiscalYearName;
  int etenderParticipationFeeValue;
  TransactionCurrencyIdName transactionCurrencyIdName;
  String? blsSummaryArabic;
  String etenderTitle;
  String emailAddress;
  String etenderTenderDateValue;
  String etenderAwardingDateValue;
  String blsClosingDateValue;
  dynamic bisStatusValue;

  Tender({
    required this.id,
    required this.etenderRefno,
    required this.blsRequestingBodyName,
    required this.blsTenderFiscalYearName,
    required this.etenderParticipationFeeValue,
    required this.transactionCurrencyIdName,
    required this.blsSummaryArabic,
    required this.etenderTitle,
    required this.emailAddress,
    required this.etenderTenderDateValue,
    required this.etenderAwardingDateValue,
    required this.blsClosingDateValue,
    required this.bisStatusValue,
  });

  factory Tender.fromJson(Map<String, dynamic> json) => Tender(
    id: json["Id"],
    etenderRefno: json["etender_refno"],
    blsRequestingBodyName: json["bls_RequestingBodyName"],
    blsTenderFiscalYearName: blsTenderFiscalYearNameValues.map[json["bls_TenderFiscalYearName"]]!,
    etenderParticipationFeeValue: json["etender_ParticipationFeeValue"].toInt(),
    transactionCurrencyIdName: transactionCurrencyIdNameValues.map[json["TransactionCurrencyIdName"]]!,
    blsSummaryArabic: json["bls_SummaryArabic"],
    etenderTitle: json["etender_Title"],
    emailAddress: json["EmailAddress"],
    etenderTenderDateValue: json["etender_TenderDateValue"],
    etenderAwardingDateValue: json["etender_AwardingDateValue"],
    blsClosingDateValue: json["bls_ClosingDateValue"],

    bisStatusValue: json["BisStatusValue"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "etender_refno": etenderRefno,
    "bls_RequestingBodyName": blsRequestingBodyName,
    "bls_TenderFiscalYearName": blsTenderFiscalYearNameValues.reverse[blsTenderFiscalYearName],
    "etender_ParticipationFeeValue": etenderParticipationFeeValue,
    "TransactionCurrencyIdName": transactionCurrencyIdNameValues.reverse[transactionCurrencyIdName],
    "bls_SummaryArabic": blsSummaryArabic,
    "etender_Title": etenderTitle,
    "EmailAddress": emailAddress,
    "etender_TenderDateValue": etenderTenderDateValue,
    "etender_AwardingDateValue": etenderAwardingDateValue,
    "bls_ClosingDateValue": blsClosingDateValue,
    "BisStatusValue": bisStatusValue,
  };
}

enum BlsTenderFiscalYearName {
  THE_20232024
}

final blsTenderFiscalYearNameValues = EnumValues({
  "2023/2024": BlsTenderFiscalYearName.THE_20232024
});

enum BlsTenderKindValue {
  EMPTY
}

final blsTenderKindValueValues = EnumValues({
  "شراء منقولات": BlsTenderKindValue.EMPTY
});

enum EtenderBiddingTypeValue {
  EMPTY
}

final etenderBiddingTypeValueValues = EnumValues({
  "دعوات": EtenderBiddingTypeValue.EMPTY
});

enum EtenderTenderStatusValue {
  EMPTY
}

final etenderTenderStatusValueValues = EnumValues({
  "مرحلة النشر": EtenderTenderStatusValue.EMPTY
});

enum TransactionCurrencyIdName {
  EMPTY
}

final transactionCurrencyIdNameValues = EnumValues({
  "جنيه مصري": TransactionCurrencyIdName.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
