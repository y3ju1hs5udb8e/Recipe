class Popular {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Popular({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}
