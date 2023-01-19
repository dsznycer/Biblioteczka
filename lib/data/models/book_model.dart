class Book {
  final String title;
  final String author;
  final int pages;
  final int yearOfEnd;
  final int score;
  final List<String> notes;

  Book(
      {this.title = '',
      this.author = '',
      this.pages = 0,
      this.notes = const [],
      this.yearOfEnd = 0,
      this.score = 0});
}
