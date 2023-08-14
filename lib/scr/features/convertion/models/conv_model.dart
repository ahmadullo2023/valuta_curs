class ConvertedModel{
  int? id;
  String? code;
  String? ccy;
  String? ccyNmRu;
  String? ccyNmUz;
  String? ccyNmUZC;
  String? ccyNmEN;
  String? nominal;
  String? rate;
  String? diff;
  String? date;

  ConvertedModel({
    this.id,
    this.code,
    this.ccy,
    this.ccyNmRu,
    this.ccyNmUz,
    this.ccyNmUZC,
    this.ccyNmEN,
    this.nominal,
    this.rate,
    this.diff,
    this.date
  });

  factory ConvertedModel.fromJson(Map<String,Object?>json)=>ConvertedModel(
    id: json["id"] as int?,
    code: json["Code"] as String?,
    ccy: json["Ccy"] as String?,
    ccyNmRu: json["CcyNm_RU"] as String?,
    ccyNmUz: json["CcyNm_UZ"] as String?,
    ccyNmUZC: json["CcyNm_UZC"] as String?,
    ccyNmEN: json["CcyNm_EN"] as String?,
    nominal: json["Nominal"] as String?,
    rate: json["Rate"] as String?,
    diff: json["Diff"] as String?,
    date: json["Date"] as String?,
  );

  Map<String,Object?>toJson()=>{
    "id":id,
    "Code":code,
    "Ccy":ccy,
    "CcyNm_RU":ccyNmRu,
    "CcyNm_UZ":ccyNmUz,
    "CcyNm_UZC":ccyNmUZC,
    "CcyNm_EN":ccyNmEN,
    "Nominal":nominal,
    "Rate":rate,
    "Diff":rate,
    "Date":date,
  };

}