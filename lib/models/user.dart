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
  User.fromJson(Map<String, dynamic> json, int index)
      : firstName = "${json[index]['name']['first']}",
        lastName = "${json[index]['name']['last']}",
        email = "${json[index]['email']}",
        age = json[index]['dob']['age'],
        phoneNum = "${json[index]['phone']}",
        city = "${json[index]['location']['city']}",
        state = "${json[index]['location']['state']}",
        country = "${json[index]['location']['country']}",
        userLargeImg = "${json[index]['picture']['large']}",
        userThumbnail = "${json[index]['picture']['thumbnail']}";

  String getFullname() {
    return '${this.firstName} ${this.lastName}';
  }

  String getLocation() {
    return '${this.city}, ${this.state}, ${this.country}';
  }
}
