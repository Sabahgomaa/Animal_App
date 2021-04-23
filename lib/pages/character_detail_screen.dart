import 'package:after_layout/after_layout.dart';
import 'package:animals_app/modules/character.dart';
import 'package:animals_app/modules/styleguide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChararcterDetailScreen extends StatefulWidget {
  final  double _expandedBottomSheet=0;
  final  double _collapsedBottomSheet=-250;
  final double _fullCollapsedBottomSheet=-330;
  final Character character;

  const ChararcterDetailScreen({Key key,this.character}):super(key:key);

  @override
  _ChararcterDetailScreenState createState() => _ChararcterDetailScreenState();
}

class _ChararcterDetailScreenState extends State<ChararcterDetailScreen> with AfterLayoutMixin<ChararcterDetailScreen> {
  double _currentButtomSheet= -330;
  bool isCollapsed=false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'background-${widget.character.name}',
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.character.colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.close, size: 40,
                        color: Colors.white.withOpacity(0.9)),
                    onPressed: () {
                      Future.delayed(const Duration(microseconds: 250),(){
                        setState(() {
                          _currentButtomSheet=widget._fullCollapsedBottomSheet;
                        });
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                      tag: 'image-${widget.character.name}',
                      child: Image.asset(widget.character.imagePath,
                        height: screenHeight * 0.45,)),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 8),
                    child: Hero(
                        tag: 'name-${widget.character.name}',
                        child: Material(
                            color: Colors.transparent,
                            child: Container(child: Text(
                              widget.character.name, style: AppTheme.heading,)
                            )
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                    child: Text(widget.character.description,
                      style: AppTheme.subHeading,))
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(microseconds: 500),
            curve: Curves.decelerate,
            bottom: _currentButtomSheet,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTab,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      height: 80,
                      child: Text("Clips",
                        style: AppTheme.subHeading.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipWidget(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _clipWidget() {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              roundContainer(Colors.redAccent),
              SizedBox(height: 20,),
              roundContainer(Colors.greenAccent)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.redAccent),
              SizedBox(height: 20,),
              roundContainer(Colors.greenAccent)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.redAccent),
              SizedBox(height: 20,),
              roundContainer(Colors.greenAccent)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.orangeAccent),
              SizedBox(height: 20,),
              roundContainer(Colors.purple)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.grey),
              SizedBox(height: 20,),
              roundContainer(Colors.blueGrey)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.lightGreenAccent),
              SizedBox(height: 20,),
              roundContainer(Colors.pinkAccent)
            ],
          ),
          SizedBox(width: 16,),
          Column(
            children: [
              roundContainer(Colors.deepOrange),
              SizedBox(height: 20,),
              roundContainer(Colors.lightBlueAccent)
            ],
          ),
        ],
      ),
    );
  }
_onTab(){
    setState(() {
      _currentButtomSheet =isCollapsed ? widget._expandedBottomSheet : widget._collapsedBottomSheet;
      isCollapsed=!isCollapsed;
    });
}
  Widget roundContainer(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }

  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(microseconds: 500),(){
      setState(() {
        isCollapsed=true;
        _currentButtomSheet =widget._collapsedBottomSheet;
      });
    });
  }
}