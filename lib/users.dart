class User {
  final String asset;
  final String name;
  final String lastText;
  final String lastTime;
  final int unread;
  final String status;

  User({
    required this.asset,
    required this.name,
    required this.lastText,
    required this.lastTime,
    required this.unread,
    required this.status,
  });
}

final List<User> users = List.generate(
  6,
  (index) => User(
      asset: "images/AnimeX_908706.jpeg",
      name: "Shogun",
      lastText: "Bonjour",
      lastTime:
          "0$index:${index * index <= 9 ? '0${index * index}' : '${index * index}'}",
      unread: index * index,
      status: "Voici mon statut"),
);
