class CatBreedImage {
  final String id;
  final String url;
  final int width;
  final int height;

  CatBreedImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatBreedImage.fromJson(Map<String, dynamic> json) => CatBreedImage(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };

  static List<CatBreedImage>? fromList(dynamic list) {
    var result = <CatBreedImage>[];
    if (list != null) {
      result = [];
      for (dynamic json in list) {
        final catBreed = CatBreedImage.fromJson(json);

        result.add(catBreed);
      }
    }
    return result;
  }
}
