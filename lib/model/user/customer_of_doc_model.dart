class CustomerOfDocModel{
  String? name;
  String? job;
  String? rating;
  String? review;
  String? imageUrl;

  CustomerOfDocModel({
    this.name,
    this.job,
    this.rating,
    this.review,
    this.imageUrl
});

  factory CustomerOfDocModel.fromJson(Map<String, dynamic>json){
    return CustomerOfDocModel(
      job: (json['job'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      imageUrl: (json['imageUrl'] ?? '').toString(),
      rating: (json['rating'] ?? '').toString(),
      review: (json['review'] ?? '').toString(),
    );
  }

}