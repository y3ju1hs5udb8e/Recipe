class Recipe {
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;

  Recipe(
      {required this.strMeal,
      required this.strCategory,
      required this.strArea,
      required this.strInstructions,
      required this.strMealThumb,
      required this.strTags,
      required this.strYoutube});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
    );
  }
}
