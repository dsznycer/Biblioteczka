class Book {
  final String title;
  final String author;
  final String pages;
  final String yearOfEnd;
  final int score;
  final List<String> notes;

  const Book(
      {this.title = '',
      this.author = '',
      this.pages = '',
      this.notes = const [],
      this.yearOfEnd = '',
      this.score = 0});
}
