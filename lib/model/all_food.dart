class AllFood {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  AllFood({
    required this.strCategoryDescription,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.idCategory,
  });

  factory AllFood.fromJson(Map<String, dynamic> json) {
    return AllFood(
      strCategoryDescription: json['strCategoryDescription'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      idCategory: json['idCategory'],
    );
  }
}
