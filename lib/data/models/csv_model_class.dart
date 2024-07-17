class CSVData {
  String city;
  String pincode;
  String stateName;

  CSVData({
    required this.city,
    required this.pincode,
    required this.stateName,
  });

  factory CSVData.fromList(List<dynamic> list) {
    return CSVData(
      city: list[0].toString(),
      pincode: list[1].toString(),
      stateName: list[2].toString(),
    );
  }
}
