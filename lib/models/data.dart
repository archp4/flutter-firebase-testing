class DataModel {
  String name;
  String companyName;
  String designation;
  String message;

  DataModel({
    required this.name,
    required this.companyName,
    required this.designation,
    required this.message,
  });

  static DataModel formJson(Map<String, dynamic> json) => DataModel(
        name: json['name'],
        companyName: json['companyName'],
        designation: json['designation'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'companyName': companyName,
        'designation': designation,
        'message': message,
      };
}

class DataModel2 {
  String id;
  String name;
  String companyName;
  String designation;
  String message;

  DataModel2({
    required this.id,
    required this.name,
    required this.companyName,
    required this.designation,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'companyName': companyName,
        'designation': designation,
        'message': message,
      };
}
