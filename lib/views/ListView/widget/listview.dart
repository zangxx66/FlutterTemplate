import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Ricardo/api/serve.dart';

class Listview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListviewState();
  }
}

class _ListviewState extends State<Listview> {
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
  List names = new List();
  int pageIndex = 1;

  void _getData() async {
    if(!isLoading){
      setState(() {
        isLoading = true;
      });

      final response = await Serve().getPeople({"page":pageIndex});
      pageIndex++;

      setState(() {
        isLoading = false;
        names.addAll(response["results"]);
      });
    }
  }

  @override
  void initState() {
    this._getData();
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: names.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if(index == names.length){
          return _buildProgressIndicator();
        }else{
          return new ListTile(
            title: Text((names[index]["name"])),
            onTap: () => Fluttertoast.showToast(msg: (names[index]["name"])),
          );
        }
      },
      controller: _scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
