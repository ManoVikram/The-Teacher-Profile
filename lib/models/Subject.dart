class Subject {
  String name;
  String imageURL;
  bool isSelected;

  Subject({
    required this.name,
    required this.imageURL,
    required this.isSelected,
  });

  void copyWith(bool value) {
    isSelected = value;
  }
}
