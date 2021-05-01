class Article {
  final String title;
  final String image;
  final String profileImage;
  final String location;
  final String author;
  final String time;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;
  final double rating;

  Article(
    this.title,
    this.image,
    this.comments,
    this.likes,
    this.isLiked,
    this.location,
    this.shares,
    this.author,
    this.profileImage,
    this.time,
    this.rating,
  );
}

List<Article> articles = [
  Article(
    'Japan\'s second largest metropolitan area',
    'https://images.wallpaperscraft.com/image/pagoda_architecture_sunlight_131905_1920x1080.jpg',
    100,
    32000,
    true,
    'OSAKA, JAPAN',
    50,
    'Hussain Mustafa',
    'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    '1 hour ago',
    3.5
  ),
  Article(
    'Known as the sleepless town for obvious reasons',
    'https://images.wallpaperscraft.com/image/night_lights_buildings_railway_station_ueno_tokyo_59511_1920x1080.jpg',
    300,
    50000,
    false,
    'KABUIKICHO, JAPAN',
    1250,
    'Tim Salvatore',
    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    '2 hour ago',
    5,
  ),
  Article(
    'Japan\'s second largest metropolitan area',
    'https://images.wallpaperscraft.com/image/street_neon_night_city_139596_1920x1080.jpg',
    200,
    10000,
    true,
    'TOKYO, JAPAN',
    1000,
    'Ely Marya',
    'https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    '3 hour ago',
    4.5
  ),
  Article(
    'Japan\'s second largest metropolitan area',
    'https://images.wallpaperscraft.com/image/pagoda_architecture_sunlight_131905_1920x1080.jpg',
    100,
    32000,
    true,
    'OSAKA, JAPAN',
    50,
    'Hussain Mustafa',
    'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    '1 hour ago',
    3
  ),
  Article(
    'Known as the sleepless town for obvious reasons',
    'https://images.wallpaperscraft.com/image/night_lights_buildings_railway_station_ueno_tokyo_59511_1920x1080.jpg',
    300,
    50000,
    false,
    'KABUIKICHO, JAPAN',
    1250,
    'Tim Salvatore',
    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    '2 hour ago',
    2.5
  ),
  Article(
    'Japan\'s second largest metropolitan area',
    'https://images.wallpaperscraft.com/image/street_neon_night_city_139596_1920x1080.jpg',
    200,
    10000,
    true,
    'TOKYO, JAPAN',
    1000,
    'Ely Marya',
    'https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    '3 hour ago',
    4
  ),
];

List<String> countries = ["INDIA", "JAPAN", "GREECE", "ITALY"];
