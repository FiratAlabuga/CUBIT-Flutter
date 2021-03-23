class IBBData {
  String jsonFeaturetype;
  int iLCEUAVT;
  String iLCEADI;
  String aDI;
  String aLTKATEGORI;
  String aDRES;
  String tELEFON;
  String wEBSITESI;
  String aCILSERVIS;
  int yATAK;
  String aMBULANS;
  String mAHALLE;
  double bOYLAM;
  double eNLEM;
  String jsonOgcWktCrs;
  JsonGeometry jsonGeometry;

  IBBData(
      {this.jsonFeaturetype,
      this.iLCEUAVT,
      this.iLCEADI,
      this.aDI,
      this.aLTKATEGORI,
      this.aDRES,
      this.tELEFON,
      this.wEBSITESI,
      this.aCILSERVIS,
      this.yATAK,
      this.aMBULANS,
      this.mAHALLE,
      this.bOYLAM,
      this.eNLEM,
      this.jsonOgcWktCrs,
      this.jsonGeometry});

  IBBData.fromJson(Map<String, dynamic> json) {
    jsonFeaturetype = json['json_featuretype'];
    iLCEUAVT = json['ILCE_UAVT'];
    iLCEADI = json['ILCE_ADI'];
    aDI = json['ADI'];
    aLTKATEGORI = json['ALT_KATEGORI'];
    aDRES = json['ADRES'];
    tELEFON = json['TELEFON'];
    wEBSITESI = json['WEBSITESI'];
    aCILSERVIS = json['ACIL_SERVIS'];
    yATAK = json['YATAK'];
    aMBULANS = json['AMBULANS'];
    mAHALLE = json['MAHALLE'];
    bOYLAM = json['BOYLAM'];
    eNLEM = json['ENLEM'];
    jsonOgcWktCrs = json['json_ogc_wkt_crs'];
    jsonGeometry = json['json_geometry'] != null
        ? new JsonGeometry.fromJson(json['json_geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['json_featuretype'] = this.jsonFeaturetype;
    data['ILCE_UAVT'] = this.iLCEUAVT;
    data['ILCE_ADI'] = this.iLCEADI;
    data['ADI'] = this.aDI;
    data['ALT_KATEGORI'] = this.aLTKATEGORI;
    data['ADRES'] = this.aDRES;
    data['TELEFON'] = this.tELEFON;
    data['WEBSITESI'] = this.wEBSITESI;
    data['ACIL_SERVIS'] = this.aCILSERVIS;
    data['YATAK'] = this.yATAK;
    data['AMBULANS'] = this.aMBULANS;
    data['MAHALLE'] = this.mAHALLE;
    data['BOYLAM'] = this.bOYLAM;
    data['ENLEM'] = this.eNLEM;
    data['json_ogc_wkt_crs'] = this.jsonOgcWktCrs;
    if (this.jsonGeometry != null) {
      data['json_geometry'] = this.jsonGeometry.toJson();
    }
    return data;
  }
}

class JsonGeometry {
  String type;
  List<double> coordinates;

  JsonGeometry({this.type, this.coordinates});

  JsonGeometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
