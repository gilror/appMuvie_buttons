import 'package:flutter/material.dart';
import 'package:movie_app/common/Util.dart';
import 'package:movie_app/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          Container(
              child: new Stack(children: <Widget>[
            new FadeInImage.assetNetwork(
              placeholder: "assets/images/load.png",
              image: media.getBackDropUrl(),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
              fadeInDuration: new Duration(milliseconds: 800),
            ),
            new Positioned(
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: new Container(
                decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 35, 48, 158)?.withOpacity(0.5)),
                constraints: new BoxConstraints.expand(height: 55.0),
              ),
            ),
            new Positioned(
              left: 10.0,
              bottom: 10.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      media.title,
                      style: new TextStyle(
                          fontFamily: "Alfa", color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  new Container(
                    width: 280.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: new Text(
                        media.getGenres(),
                        style: TextStyle(fontFamily: "PT"),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Positioned(
              right: 10.0,
              bottom: 10.0,
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text(media.voteAverage.toString()),
                      new Container(
                        width: 5.0,
                      ),
                      new Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.lime[900],
                      )
                    ],
                  ),
                  new Container(
                    height: 4.0,
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(media.getReleaseYear().toString()),
                      new Container(
                        width: 4.0,
                      ),
                      new Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
