/// This class will contain all the user data
class User {
  /// User's attributes
  String firstName;
  String lastName;
  String email;
  int age;
  String phoneNumber;
  String city;
  String state;
  String country;
  String userThumbnail;
  String userLargeImage;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.age,
      this.phoneNumber,
      this.city,
      this.state,
      this.country,
      this.userThumbnail,
      this.userLargeImage});

  /// User.fromJson constructor will serialize the user info data and instantiate User
  /// Here semi-colon is to assign final fields before the body is executed.
  User.fromJson(Map<String, dynamic> json)
      : this.firstName = "${json['name']['first']}",
        this.lastName = "${json['name']['last']}",
        this.email = "${json['email']}",
        this.age = json['dob']['age'],
        this.phoneNumber = "${json['phone']}",
        this.city = "${json['location']['city']}",
        this.state = "${json['location']['state']}",
        this.country = "${json['location']['country']}",
        this.userLargeImage = "${json['picture']['large']}",
        this.userThumbnail = "${json['picture']['thumbnail']}";

  /// Get user fullname
  String getFullName() => '${this.firstName} ${this.lastName}';

  /// Get user full location
  String getLocation() => '${this.city}, ${this.state}, ${this.country}';
}
