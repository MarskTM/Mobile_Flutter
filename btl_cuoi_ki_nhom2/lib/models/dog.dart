import 'package:cloud_firestore/cloud_firestore.dart';

class Dog {
  int id;
  String breed;
  String imageUrl;
  String favoriteFood;
  String favoriteToy;
  String price;
  String description;

  Dog(this.id, this.breed, this.imageUrl, this.favoriteFood, this.favoriteToy,
      this.price, this.description);
}
