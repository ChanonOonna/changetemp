class TEMPmodel {
  String? title;
  Tempdata? tempdata;

  TEMPmodel({this.title, this.tempdata});

  TEMPmodel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    tempdata = json['tempdata'] != null
        ? Tempdata.fromJson(json['tempdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    if (this.tempdata != null) {
      data['tempdata'] = this.tempdata!.toJson();
    }
    return data;
  }
}

class Tempdata {
  double? temperature;
  String? unit;
  double? celsius;
  double? fahrenheit;
  double? reaumur;
  double? kelvin;

  Tempdata(
      {this.temperature,
      this.unit,
      this.celsius,
      this.fahrenheit,
      this.reaumur,
      this.kelvin});

  Tempdata.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'] != null ? double.tryParse(json['temperature'].toString()) : null;
    unit = json['unit'];
    celsius = json['Celsius'] != null ? double.tryParse(json['Celsius'].toString()) : null;
    fahrenheit = json['Fahrenheit'] != null ? double.tryParse(json['Fahrenheit'].toString()) : null;
    reaumur = json['Réaumur'] != null ? double.tryParse(json['Réaumur'].toString()) : null;
    kelvin = json['Kelvin'] != null ? double.tryParse(json['Kelvin'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature'] = this.temperature;
    data['unit'] = this.unit;
    data['Celsius'] = this.celsius;
    data['Fahrenheit'] = this.fahrenheit;
    data['Réaumur'] = this.reaumur;
    data['Kelvin'] = this.kelvin;
    return data;
  }
}
