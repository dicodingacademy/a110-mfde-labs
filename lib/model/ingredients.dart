class Ingredients {
  final String idIngredient;
  final String strIngredient;

  Ingredients(this.idIngredient, this.strIngredient);

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
        json['idIngredient'],
        json['strIngredient']
    );
  }
}