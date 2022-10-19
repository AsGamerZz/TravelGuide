class RestaurentModel {
  String? id;
  String? restaurentname;
  String? restaurentcity;
  String? restaurentlocation;
  String? restaurentdescription;
  String? image;
  double? lat;
  double? lng;


  RestaurentModel({
    this.id,
    this.restaurentcity,
    this.restaurentdescription,
    this.restaurentlocation,
    this.restaurentname,
    this.image,
    this.lat,
    this.lng,
  });
}
