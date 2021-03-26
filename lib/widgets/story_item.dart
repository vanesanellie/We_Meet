import 'package:flutter/material.dart';

import 'package:flutter_application_1/theme/colors.dart';
import 'package:flutter_application_1/constant/post_json.dart';
import 'package:flutter_application_1/constant/story_json.dart';
import 'package:flutter_application_1/widgets/story_item.dart';

class StoryItem extends StatelessWidget {
 final String img;
 final String name;
  const StoryItem({
    Key key, this.img, this.name, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20, 
      bottom: 10),
      child: Column(children: <Widget>[
        Container(
            width: 68,
            height: 75,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: storyBorderColor)),
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              img,
                            ),
                            fit: BoxFit.cover))))),
        SizedBox(height: 8.0),
        SizedBox(
          width: 45,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: black,
          ),
          ),
        )
      ]),
    );
  }
}
