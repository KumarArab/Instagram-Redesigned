import 'package:Instagram/models/post.dart';
import 'package:Instagram/models/story.dart';
import 'package:Instagram/post-details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      title: 'Devotion',
      theme: appTheme,
    );
  }
}

ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen',
  primaryColor: Colors.purpleAccent,
);

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
            width: _width,
            height: _height,
            child: Column(children: [
              Container(
                height: _height * 0.18,
                padding: EdgeInsets.symmetric(
                  vertical: _height * 0.02,
                  horizontal: _width * 0.05,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: _width * 0.175,
                          height: _width * 0.175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              )),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: _width * 0.02,
                        ),
                        Text(
                          "My Story",
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: _width * 0.68,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: stories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return StoriesUI(
                            name: stories[index].name,
                            image: stories[index].imageUrl,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PostsUI(
                        post: posts[0],
                        order: 0,
                      ),
                      PostsUI(
                        post: posts[1],
                        order: 1,
                      ),
                      PostsUI(
                        post: posts[2],
                        order: 2,
                      ),
                      PostsUI(
                        post: posts[3],
                        order: 3,
                      ),
                      PostsUI(
                        post: posts[4],
                        order: 4,
                      ),
                      PostsUI(
                        post: posts[5],
                        order: 5,
                      ),
                      PostsUI(
                        post: posts[6],
                        order: 6,
                      ),
                      PostsUI(
                        post: posts[7],
                        order: 7,
                      ),
                      PostsUI(
                        post: posts[8],
                        order: 8,
                      ),
                      PostsUI(
                        post: posts[9],
                        order: 9,
                      ),
                      PostsUI(
                        post: posts[10],
                        order: 10,
                      ),
                      PostsUI(
                        post: posts[11],
                        order: 11,
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}

class PostsUI extends StatefulWidget {
  final Post post;
  final int order;
  PostsUI({this.post, this.order});

  @override
  _PostsUIState createState() => _PostsUIState();
}

class _PostsUIState extends State<PostsUI> {
  double _likeWidth = 0;
  double _likeHeight = 0;
  bool isLiked = false;
  Future<void> showLiked() async {
    setState(() {
      _likeHeight = 100;
      _likeWidth = 100;
      isLiked = !isLiked;
    });
    await Future.delayed(Duration(milliseconds: 500));
  }

  void hideLiked() async {
    setState(() {
      _likeHeight = 0;
      _likeWidth = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double offset_y = widget.order * -50.1;
    return Transform.translate(
      offset: Offset(0, offset_y),
      child: GestureDetector(
        onDoubleTap: () {
          showLiked().then(
            (value) => hideLiked(),
          );
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => PostDetails(
                  post: widget.post,
                  order: widget.order,
                ),
              ));
        },
        child: Hero(
          tag: "PostPic${widget.order}",
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.post.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 50,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      gradient: new LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.3, 0.8]),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  widget.post.dp,
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.post.username,
                                style: GoogleFonts.quicksand(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 10,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 10,
                                width: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 10,
                                width: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: isLiked
                                        ? Colors.red.withOpacity(0.5)
                                        : Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color:
                                            isLiked ? Colors.red : Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.post.likesCount,
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.commentDots,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  widget.post.commentsCount,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.paperPlane,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                  height: _likeHeight,
                  width: _likeWidth,
                  child: Image.asset(
                    "assets/images/like.png",
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StoriesUI extends StatelessWidget {
  final String name, image;
  StoriesUI({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: new LinearGradient(
                colors: [
                  Color(0xff405DE6),
                  Color(0xff5851DB),
                  Color(0xff833AB4),
                  Color(0xffC13584),
                  Color(0xffC13584),
                  Color(0xffFD1D1D),
                  Color(0xffF56040),
                  Color(0xffF77737),
                  Color(0xffFCAF45),
                  Color(0xffFFDC80),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(28),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: _width * 0.02,
          ),
          Text(
            name,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
