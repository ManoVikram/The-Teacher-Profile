class Subject {
  String name;
  String imageURL;
  bool isSelected;

  Subject({
    required this.name,
    required this.imageURL,
    this.isSelected = false,
  });

  void copyWith(bool value) {
    isSelected = value;
  }
}
