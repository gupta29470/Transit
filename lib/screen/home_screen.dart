import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _deviceHeight, _deviceWidth;
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(
          _deviceWidth * 0.05,
          _deviceHeight * 0.05,
          _deviceWidth * 0.05,
          _deviceHeight * 0.05,
        ),
        child: _parentWidget(context),
      ),
    );
  }

  Widget _parentWidget(BuildContext buildContext) {
    return Column(
      children: <Widget>[
        _topWidget(),
        Padding(
          padding: EdgeInsets.only(
            top: _deviceHeight * 0.03,
            bottom: _deviceHeight * 0.03,
          ),
          child: _locationBarWidget(buildContext),
        ),
        _articlesListWidget(buildContext),
      ],
    );
  }

  Widget _topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.menu_rounded,
          color: Colors.black87,
          size: 35,
        ),
        Container(
          height: 39,
          width: 144,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/logo_discover.png"),
            ),
          ),
        ),
        Icon(
          Icons.search_rounded,
        ),
      ],
    );
  }

  Widget _locationBarWidget(BuildContext buildContext) {
    return Container(
      height: _deviceHeight * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: countries.map((city) {
          bool _isActive = countries[_activeLocation] == city;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                city,
                style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white60,
                    fontFamily: "Montserrat"),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _isActive ? Colors.redAccent : Colors.transparent,
                ),
                height: 4,
                width: 40,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articlesListWidget(BuildContext buildContext) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: _deviceHeight * 0.03),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: _deviceHeight * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(articles[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 3,
                          blurRadius: 20,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 30, 0),
                      child: _articleInfoColumnWidget(buildContext, index),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                left: _deviceWidth * 0.15,
                child: _socialInfoWidget(buildContext, index),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _articleInfoColumnWidget(BuildContext buildContext, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _authorInfoWidget(buildContext, index),
        Padding(
          padding: EdgeInsets.fromLTRB(30, _deviceHeight * 0.05, 30, 0),
          child: _detailInfoWidget(buildContext, index),
        ),
      ],
    );
  }

  Widget _authorInfoWidget(BuildContext buildContext, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(articles[index].profileImage),
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles[index].author,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    articles[index].time,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              articles[index].isLiked
                  ? Icons.favorite_outlined
                  : Icons.favorite_border,
              color: Colors.redAccent,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                !articles[index].isLiked
                    ? Icons.bookmark_outlined
                    : Icons.bookmark_border,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _detailInfoWidget(BuildContext buildContext, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: _deviceWidth * 0.45,
                child: Text(
                  articles[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 2.5,
              ),
              Text(
                articles[index].location,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Montserrat",
                ),
              ),
              SizedBox(
                height: 2.5,
              ),
              _ratingWidget(buildContext),
              SizedBox(
                height: 2.5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ratingWidget(BuildContext buildContext) {
    return Row(
      children: List<Widget>.generate(
        5,
        (currentIndex) {
          Icon starIcon;
          double fillAmount = articles[currentIndex].rating - currentIndex;
          if (fillAmount >= 1) {
            starIcon = Icon(
              Icons.star,
              color: Colors.amber,
              size: 15,
            );
          } else if (fillAmount >= 0.5) {
            starIcon = Icon(
              Icons.star_half,
              color: Colors.amber,
              size: 15,
            );
          } else {
            starIcon = Icon(
              Icons.star_border,
              color: Colors.amber,
              size: 15,
            );
          }
          return starIcon;
        },
      ),
    );
  }

  Widget _socialInfoWidget(BuildContext buildContext, int index) {
    return Container(
      height: _deviceHeight * 0.07,
      width: _deviceWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[index].likes.toString(),
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.mode_comment,
                color: Colors.blueGrey,
              ),
              Text(
                articles[index].comments.toString(),
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.blueGrey,
              ),
              Text(
                articles[index].shares.toString(),
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
