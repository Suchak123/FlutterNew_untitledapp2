class TopPicksModel{
  String? url;
  double? rating;
  String? title;

  TopPicksModel({this.url, this.rating, this.title});
}

final List<TopPicksModel>topPicksList = [
  TopPicksModel(url: 'https://m.media-amazon.com/images/M/MV5BMTg3ODY5ODI1NF5BMl5BanBnXkFtZTgwMTkxNTYxMTE@._V1_QL75_UX380_CR0,0,380,562_.jpg', title: "American Pie", rating: 2.2),
  TopPicksModel(url: 'https://i.ibb.co/QCT5fMF/movie2.jpg', title: "Live Hard", rating: 6.2),
  TopPicksModel(url: 'https://i.ibb.co/TbJ9cwZ/movie3.jpg', title: "Breaking Good", rating: 7.2),
  TopPicksModel(url: 'https://i.ibb.co/XVYT7M7/movie1.jpg', title: "Willy Wonka", rating: 7.2),
];

