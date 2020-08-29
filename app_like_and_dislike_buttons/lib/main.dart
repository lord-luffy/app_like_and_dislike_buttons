import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('APP LIKE AND DISLIKE BUTTONS'),
          backgroundColor: Colors.grey[700],
        ),
        body: LikeAndDislikePage(),
      ),
    ),
  );
}

class LikeAndDislikePage extends StatefulWidget {
  @override
  _LikeAndDislikePageState createState() => _LikeAndDislikePageState();
}

class _LikeAndDislikePageState extends State<LikeAndDislikePage> {
  bool like = false;
  bool dislike = false;

  void changeLikeOrDislike(String operation) {
    setState(() {
      if (operation == 'like') {
        like = !like;
        dislike = false;
      } else if (operation == 'dislike') {
        dislike = !dislike;
        like = false;
      }
    });
  }

  Color getButtonColor(String buttonType) {
    if (
      buttonType == 'like' && like
      || buttonType == 'dislike' && dislike
    ) {
      return Colors.blue[800];
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          //Get students to create the second die as a challenge
          Expanded(
            child: FlatButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      size: 30,
                      color: getButtonColor('like'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "LIKE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: getButtonColor('like')),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                changeLikeOrDislike('like');
              },
            ),
          ),

          Expanded(
            child: FlatButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_down,
                      size: 30,
                      color: getButtonColor('dislike'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "DISLIKE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: getButtonColor('dislike')),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                changeLikeOrDislike('dislike');
              },
            ),
          ),
        ],
      ),
    );
  }
}
