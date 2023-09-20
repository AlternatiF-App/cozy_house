class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  Space({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
    this.price = 0,
    this.city = '',
    this.country = '',
    this.rating = 0,
    this.address = '',
    this.phone = '',
    this.mapUrl = '',
    this.photos = const [],
    this.numberOfKitchens = 0,
    this.numberOfBedrooms = 0,
    this.numberOfCupboards = 0
  });

  factory Space.fromJson(Map<String, dynamic> json) => Space(
    id: json['id'],
    name: json['name'],
    imageUrl: json['image_url'],
    price: json['price'],
    city: json['city'],
    country: json['country'],
    rating: json['rating'],
    address: json['address'],
    phone: json['phone'],
    mapUrl: json['map_url'],
    photos: json['photos'],
    numberOfKitchens: json['number_of_kitchens'],
    numberOfBedrooms: json['number_of_bedrooms'],
    numberOfCupboards: json['number_of_cupboards']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "price": price,
    "city": city,
    "country": country,
    "rating": rating,
    "address": address,
    "phone": phone,
    "mapUrl": mapUrl,
    "photos": photos,
    "numberOfKitchens": numberOfKitchens, 
    "numberOfBedrooms": numberOfBedrooms,
    "numberOfCupboards": numberOfCupboards
  };
}