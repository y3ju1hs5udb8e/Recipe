class ItemFood {
  String strMeal;
  String strMealThumb;
  String idMeal;

  ItemFood({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory ItemFood.fromJson(Map<String, dynamic> json) {
    return ItemFood(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}
