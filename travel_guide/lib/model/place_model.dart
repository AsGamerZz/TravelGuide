class PlaceModel {
  String? id;
  String? placename;
  String? placecity;
  String? placelocation;
  String? placedescription;
  String? image;
  double? lat;
  double? lng;

  PlaceModel({
    this.id,
    this.placecity,
    this.placedescription,
    this.placelocation,
    this.placename,
    this.image,
    this.lat,
    this.lng,
  });
}
