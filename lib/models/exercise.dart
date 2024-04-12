class Exercise {
  Exercise(
      {required this.name,
      required this.description,
      required this.youtubeURL});

  final String name;
  final String description;
  final String youtubeURL;

  String getYoutubeID() {
    return youtubeURL.substring(youtubeURL.length - 11);
  }
}
