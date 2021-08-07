class User {
  final String image;
  final String name;
  final String lastText;
  final String lastTime;
  final int unread;
  final String status;

  User({
    required this.image,
    required this.name,
    required this.lastText,
    required this.lastTime,
    required this.unread,
    required this.status,
  });
}

final List<User> users = [
  User(
    image: "https://randomuser.me/api/portraits/med/women/17.jpg",
    name: "Adrize Peixoto",
    lastText: "I live in Tjarnsweer",
    lastTime: "02:00",
    unread: 5,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/19.jpg",
    name: "Baptiste Sanchez",
    lastText: "Bonjour",
    lastTime: "10:58",
    unread: 0,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/73.jpg",
    name: "Archie Harris",
    lastText: "Hi",
    lastTime: "17:38",
    unread: 3,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/women/46.jpg",
    name: "Sofija Krog",
    lastText: "Salut",
    lastTime: "12:00",
    unread: 0,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/women/22.jpg",
    name: "Peyton Thompson",
    lastText: "Comment ?",
    lastTime: "17:17",
    unread: 5,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/90.jpg",
    name: "Ramon Ibañez",
    lastText: "Seeking for you",
    lastTime: "03:45",
    unread: 12,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/women/39.jpg",
    name: "Evelyn Evelyn",
    lastText: "onze douze",
    lastTime: "16:30",
    unread: 0,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/90.jpg",
    name: "Ramon Ibañez",
    lastText: "Seet",
    lastTime: "12:13",
    unread: 0,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/17.jpg",
    name: "Luciano Giraud",
    lastText: "Bienvenue",
    lastTime: "04:50",
    unread: 2,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/women/77.jpg",
    name: "Kim Mitchell",
    lastText: "here is Paris",
    lastTime: "02:00",
    unread: 12,
    status: "I am open to chat"
  ),
  User(
    image: "https://randomuser.me/api/portraits/med/men/66.jpg",
    name: "Ludovino Mendes",
    lastText: "Messi leaving Barca",
    lastTime: "02:00",
    unread: 12,
    status: "I am open to chat"
  ),
];
