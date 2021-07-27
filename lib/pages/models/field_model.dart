class FieldModel {
  final String name;
  final String descriptionField;
  final String openTime;
  final String closeTime;
  final String avatarUrl;
  final List<String> imgUrl;
  final int price;
  final double distance;
  final String content;

  FieldModel({
    required this.name,
    required this.descriptionField,
    required this.openTime,
    required this.closeTime,
    required this.avatarUrl,
    required this.imgUrl,
    required this.price,
    required this.distance,
    required this.content,
  });
}

final fieldList = [
  FieldModel(
    name: "Strawberry Field",
    descriptionField:
        "Strawberry Field is a multi-purpase stadium for all kind of sport. The pitch size, as lined for association football, is 115 yd (105 m) long by 75yd (69 m) wide.",
    openTime: "05:00 AM",
    closeTime: "21:00 PM",
    avatarUrl: "assets/images/b99896e0f5a58fa97cb700e82a47d029.jpg",
    imgUrl: [
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg"
    ],
    price: 180000,
    distance: 1.30,
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget mi a nunc sed",
  ),
  FieldModel(
    name: "Penny Lano Field",
    descriptionField:
        "Strawberry Field is a multi-purpase stadium for all kind of sport. The pitch size, as lined for association football, is 115 yd (105 m) long by 75yd (69 m) wide.",
    openTime: "00:00 AM",
    closeTime: "24:00 PM",
    avatarUrl: "assets/images/penny_lano_field.jpg",
    imgUrl: [
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg"
    ],
    price: 300000,
    distance: 2.50,
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget mi a nunc sed",
  ),
  FieldModel(
    name: "Joshamtp Field",
    descriptionField:
        "Strawberry Field is a multi-purpase stadium for all kind of sport. The pitch size, as lined for association football, is 115 yd (105 m) long by 75yd (69 m) wide.",
    openTime: "06:00 AM",
    closeTime: "23:00 PM",
    avatarUrl: "assets/images/josh_field.jpg",
    imgUrl: [
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg"
    ],
    price: 200000,
    distance: 5.00,
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget mi a nunc sed",
  ),
  FieldModel(
    name: "Lapangan Field",
    descriptionField:
        "Strawberry Field is a multi-purpase stadium for all kind of sport. The pitch size, as lined for association football, is 115 yd (105 m) long by 75yd (69 m) wide.",
    openTime: "06:00 AM",
    closeTime: "21:00 PM",
    avatarUrl: "assets/images/lapangan_field.jpeg",
    imgUrl: [
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg",
      "assets/images/images (2).jpg"
    ],
    price: 200000,
    distance: 5.50,
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget mi a nunc sed",
  )
];
