class TopPicksModel{
  String? url;
  double? rating;
  String? title;

  TopPicksModel({this.url, this.rating, this.title});
}

final List<TopPicksModel>topPicksList = [
  TopPicksModel(url: 'https://m.media-amazon.com/images/M/MV5BMTg3ODY5ODI1NF5BMl5BanBnXkFtZTgwMTkxNTYxMTE@._V1_QL75_UX380_CR0,0,380,562_.jpg', title: "American Pie", rating: 2.2),
  TopPicksModel(url: 'https://i.ibb.co/QCT5fMF/movie2.jpg', title: "American Pie", rating: 6.2),
  TopPicksModel(url: 'https://i.ibb.co/TbJ9cwZ/movie3.jpg', title: "American Pie", rating: 7.2),
  TopPicksModel(url: 'https://scontent.fktm3-1.fna.fbcdn.net/v/t1.15752-9/420073245_746370890778152_806162138346340733_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=JzflJUZBspoAX-YzEn9&_nc_ht=scontent.fktm3-1.fna&oh=03_AdQ1Z9O_pSxgsTl3HFpMAKUTXECn1rjHm0WG1tIL3rVhfg&oe=65DFC03F', title: "Sex/ Life", rating: 7.2),
];

