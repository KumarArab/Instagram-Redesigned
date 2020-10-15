class Post {
  String dp, username, likesCount, commentsCount, imageUrl;

  Post({
    this.dp,
    this.username,
    this.likesCount,
    this.commentsCount,
    this.imageUrl,
  });
}

List<Post> posts = [
  Post(
    dp: "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Robert Pattinson",
    likesCount: "1.5k",
    commentsCount: "340",
    imageUrl:
        "https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Emma Jones",
    likesCount: "599",
    commentsCount: "30",
    imageUrl:
        "https://images.unsplash.com/photo-1509955252650-8f558c2b8735?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Olivia Carol",
    likesCount: "2.5k",
    commentsCount: "150",
    imageUrl:
        "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1485206412256-701ccc5b93ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Mark Rumolow",
    likesCount: "150",
    commentsCount: "20",
    imageUrl:
        "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=635&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Chris Pratt",
    likesCount: "1.2k",
    commentsCount: "79",
    imageUrl:
        "https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=644&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1482235225574-c37692835cf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Tony James",
    likesCount: "5.9k",
    commentsCount: "340",
    imageUrl:
        "https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "The Flutter Guy",
    likesCount: "99k",
    commentsCount: "59K",
    imageUrl:
        "https://images.unsplash.com/photo-1581466046976-1a136fdf99ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1492447166138-50c3889fccb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Ben Tennyson",
    likesCount: "1.2k",
    commentsCount: "88",
    imageUrl:
        "https://images.unsplash.com/photo-1592673750632-ef9c1b36c618?ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1500521680613-a8f77c5cd0f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Michael Jordan",
    likesCount: "5.9k",
    commentsCount: "240",
    imageUrl:
        "https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1504703395950-b89145a5425b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Charlotte Rose",
    likesCount: "5.5k",
    commentsCount: "820",
    imageUrl:
        "https://images.unsplash.com/photo-1542206395-9feb3edaa68d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1464998857633-50e59fbf2fe6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Peter Parker",
    likesCount: "3.4k",
    commentsCount: "430",
    imageUrl:
        "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1349&q=80",
  ),
  Post(
    dp: "https://images.unsplash.com/photo-1467632499275-7a693a761056?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    username: "Kattylab",
    likesCount: "1.2k",
    commentsCount: "300",
    imageUrl:
        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80",
  ),
];
