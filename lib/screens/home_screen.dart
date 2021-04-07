import 'package:flutter/material.dart';
import 'package:random_people_fluttering/constants.dart';
import 'package:random_people_fluttering/models/user.dart';
import 'package:random_people_fluttering/repositories/repositories.dart';
import 'package:random_people_fluttering/screens/info_screen.dart';
import 'package:random_people_fluttering/shared/widgets/widgets.dart';

/// Controller
class HomeController {
  final UserRepository _userRepository = UserRepository();

  /// Fetch users info
  Future<List<User>> fetchUsersData() => _userRepository.getUser();
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController _homeController = HomeController();
  Future usersListFuture;

  @override
  void initState() {
    super.initState();

    /// Fetching the user data when the widget is mounting and then passig the
    /// Future `this.usersListFuture` to `this._buildUserInfo` Future.builder's future
    /// rather than directly passing `this._homeController.fetchUsersData()` to
    /// `this._buildUserInfo` Future.builder's future (because if we fetch users data
    /// by that way then whenever we update the App Theme the `this._homeController.fetchUsersData()`
    /// will be called, so we'll be making multiple api calls even if our HomeScreen widget
    /// is mounted)
    ///
    /// Reason for this behaviour: This is due to state changes that come if setState()
    /// called, which triggers build() method, and due to this inside widgets will be re-initialize
    /// again. So, how we can stop it? In this case we had the App Theme update state change which was
    /// triggering build() method which in turn re-initialized its childrens.
    ///
    /// Helpful resource: https://medium.com/flutterworld/why-future-builder-called-multiple-times-9efeeaf38ba2
    this.usersListFuture = this._homeController.fetchUsersData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      /// Wrapping AppBar with PreferredSize to increase the height of the AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: 'Random People'),
      ),

      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            children: [
              this._buildAppInfoText(),
              SizedBox(height: space),
              this._buildUsersListView()
            ],
          ),
        ),
      ),
    );
  }

  /// Text explains what is this app about
  Widget _buildAppInfoText() => Padding(
        padding: EdgeInsets.all(space),
        child: Text(
          'Here Random User Generator API is used to get users data which is displayed using the Flutter frontend UI.',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      );

  /// Users list
  /// Wrapping with Expanded to making the ListView scroll in its own place
  /// This also centers the Loader
  Widget _buildUsersListView() => Expanded(
        child: FutureBuilder<List<User>>(
          // future: this._homeController.fetchUsersData(),
          future: this.usersListFuture,
          builder: (context, snapshot) {
            List<User> users = snapshot.data;
            if (users == null) return Loader();
            if (users.isEmpty) {
              return Text(
                'No users',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(boxShadow: [shadow]),
                height: space * 20,
                child: Card(
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                    onTap: () => this._navigateToInfoScreen(
                      users[index],
                      index,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        this._buildUserThumbnail(
                          photoUrl: users[index].userLargeImage,
                          id: index,
                        ),
                        this._buildUserInfo(
                          fullname: users[index].getFullName(),
                          location: users[index].getLocation(),
                          user: users[index],
                          index: index,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  /// User info for individual user in the Users ListView
  Widget _buildUserInfo({
    String fullname,
    String location,
    User user,
    int index,
  }) =>
      Expanded(
        child: Container(
          padding: EdgeInsets.all(space),
          height: space * 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullname,
                style: Theme.of(context).textTheme.headline3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: space * 0.7),
              Text(
                location,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: space),
              this._buildReadMoreButton(user: user, index: index),
            ],
          ),
        ),
      );

  /// Users thumbnail (their profile pic)
  Widget _buildUserThumbnail({String photoUrl, int id}) => Hero(
        tag: 'user_img$id',
        child: Container(
          padding: EdgeInsets.all(space),
          height: space * 18,
          width: space * 18,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.25),
                blurRadius: 10.0,
                offset: Offset(1, 1),
              ),
            ],
          ),

          /// Wrapping Image with ClipRRect to give borderRadius to the Image
          child: ClipRRect(
            borderRadius: BorderRadius.circular(space),
            child: Image(
              image: NetworkImage(photoUrl),
              height: space * 18,
              width: space * 18,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

  /// Read more btn
  Widget _buildReadMoreButton({User user, int index}) => ElevatedButton(
        child: Text(
          'read more...',
          style: Theme.of(context).textTheme.headline4,
        ),
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: () => this._navigateToInfoScreen(user, index),
      );

  /// To navigate to invdividual user info
  Future<dynamic> _navigateToInfoScreen(User user, int index) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoScreen(
            id: index,
            username: user.getFullName(),
            userImg: user.userLargeImage,
            location: user.getLocation(),
            email: user.email,
            age: user.age,
            phoneNumber: user.phoneNumber,
          ),
        ),
      );
}
