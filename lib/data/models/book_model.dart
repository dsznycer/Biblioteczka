class Book {
  final String title;
  final String author;
  final int pages;
  final int yearOfEnd;
  final int score;
  final String notes;

  Book(
      {this.title = '',
      this.author = '',
      this.notes = '',
      this.pages = 0,
      this.yearOfEnd = 0,
      this.score = 0});
}
