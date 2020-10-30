class User {
  final String userThumbnail;
  final String userLargeImg;
  final String firstName;
  final String lastName;
  final String email;
  final int age;
  final String phoneNum;
  final String city;
  final String state;
  final String country;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.age,
    this.phoneNum,
    this.city,
    this.state,
    this.country,
    this.userThumbnail,
    this.userLargeImg,
  });

  // semi-colon, to assign final fields before the body
  // is executed
  User.fromJson(Map<String, dynamic> json)
      : firstName = "${json['name']['first']}",
        lastName = "${json['name']['last']}",
        email = "${json['email']}",
        age = json['dob']['age'],
        phoneNum = "${json['phone']}",
        city = "${json['location']['city']}",
        state = "${json['location']['state']}",
        country = "${json['location']['country']}",
        userLargeImg = "${json['picture']['large']}",
        userThumbnail = "${json['picture']['thumbnail']}";

  String getFullname() {
    return '${this.firstName} ${this.lastName}';
  }

  String getLocation() {
    return '${this.city}, ${this.state}, ${this.country}';
  }
}
