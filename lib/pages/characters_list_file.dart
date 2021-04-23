import 'package:animals_app/modules/character.dart';
import 'package:animals_app/modules/styleguide.dart';
import 'package:animals_app/widgets/character_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CharacteraListScreen extends StatefulWidget {
  @override
  _CharacteraListScreenState createState() => _CharacteraListScreenState();
}

class _CharacteraListScreenState extends State<CharacteraListScreen> {
  PageController _pageController ;
  int currentPage =0;

  @override
  void initState(){
    super.initState();
    _pageController =PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
        keepPage:false
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 32,top: 8),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(text: "Animals Kingdom",style:AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Characters",style:AppTheme.display2)
                  ]
                )),
              ),
              Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      children:<Widget>[
                        for(var i=0;i<characters.length;i++)
                        CharacterWidget(character:characters[i],pageController:_pageController,currentPage:i)
                      ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
