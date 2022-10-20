import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/media_list_item.dart';
import 'package:movie_app/common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;

  MediaList(this.provider, this.category);

  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMovie();
    //loadSeries();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      // ignore: deprecated_member_use
      _media = [];
      loadMovie();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMovie() async {
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(media);
    });
  }

  // void loadShows() async {
  //   var series = await HttpHandler().fetchShows();
  //   setState(() {
  //     _media.addAll(series);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}
