class FullContent {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String bannerUrl;
  final double accuracy;
  final List<String> tags;
  final List<String> cast;
  final String director;
  final bool isNew;
  final String year;
  final int ageCategory;
  final int numOfSeasons;
  final String quality;
  final List<int> related;

  FullContent({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.bannerUrl,
    this.accuracy,
    this.tags,
    this.cast,
    this.director,
    this.isNew,
    this.year,
    this.ageCategory,
    this.numOfSeasons,
    this.quality,
    this.related,
  });
}

enum Quality {
  HD, HDR,
}
