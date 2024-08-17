class ReviewAndRatingModel {
  const ReviewAndRatingModel({
    required this.author,
    required this.content,
    required this.date,
    required this.rating,
    required this.reaction,
  });
  final int rating;
  final String content, reaction, author;
  final String date;
}
