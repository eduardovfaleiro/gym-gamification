class Exercise {
  final String name;

  Exercise({required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
