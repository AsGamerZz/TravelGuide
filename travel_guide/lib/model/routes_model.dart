class RoutesModel {
  String? id;
  String? routename;
  String? routecity;
  String? routelocation;
  String? routedescription;
  String? image;
  double? lat;
  double? lng;

  RoutesModel({
    this.id,
    this.routecity,
    this.routedescription,
    this.routelocation,
    this.routename,
    this.image,
    this.lat,
    this.lng,
  });
}
