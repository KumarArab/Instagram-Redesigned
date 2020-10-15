import 'package:Instagram/models/likes.dart';
import 'package:Instagram/models/post.dart';
import 'package:Instagram/userData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  final int order;
  PostDetails({this.post, this.order});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool isLikesOpen = false;
  double likesHeight = 200;
  void showLikes() {
    setState(() {
      likesHeight = isLikesOpen ? 200 : 700;
    });
    isLikesOpen = !isLikesOpen;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: Stack(
            children: [
              Hero(
                tag: "PostPic${widget.order}",
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.post.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
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
                          PostTopDetails(post: widget.post),
                          Spacer(),
                          PostBottomDetails(post: widget.post),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: likesHeight,
                        width: _width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                showLikes();
                              },
                              icon: Icon(
                                !isLikesOpen
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: likes.length,
                                  itemBuilder: (ctx, index) {
                                    return ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          likes[index].profilePic,
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        likes[index].name,
                                        style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        likes[index].name,
                                        style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: Container(
                                        width: 130,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Text(
                                                "Reply",
                                                style: GoogleFonts.quicksand(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: _width * 0.92,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff333333),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                dp,
                                height: 40,
                              ),
                            ),
                            Expanded(
                              child: TextField(),
                            ),
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostBottomDetails extends StatelessWidget {
  const PostBottomDetails({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    post.likesCount,
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
              post.commentsCount,
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
        ));
  }
}

class PostTopDetails extends StatelessWidget {
  const PostTopDetails({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              post.dp,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            post.username,
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
    );
  }
}
