class Userdata {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Userdata({required this.strMeal, required this.strMealThumb, required this.idMeal});

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }
}


// Userdata
