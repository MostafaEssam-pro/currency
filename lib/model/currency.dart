class CurrencyHub {
  late List<Currency> currency;

  CurrencyHub({required this.currency});

  CurrencyHub.fromJson(json) {


    if (json['currency'] != null) {
      currency = <Currency>[];
      json['currency'].forEach((v) {
        currency.add(Currency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['currency'] = currency.map((v) => v.toJson()).toList();
    return data;
  }
}

class Currency {
  late String status;
  late int time;
  late double result;
  late double approxResult;

  Currency.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    time = json['time'];
    result = json['result'];
    approxResult = json['approxResult'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['time'] = time;
    _data['result'] = result;
    _data['approxResult'] = approxResult;
    return _data;
  }
}
