import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton(
      {@required this.image,
        @required this.title,
        this.route,
        this.onClick,
        this.alignment = Alignment.center,
        this.textColor});

  final Image image;
  final String title;
  final String route;
  final Alignment alignment;
  final void Function() onClick;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var _textColor = textColor ?? Theme.of(context)
      .accentTextTheme
      .display3
      .backgroundColor;

    return Container(
      padding: EdgeInsets.only(top: 14, bottom: 16, left: 10, right: 10),
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (route?.isNotEmpty ?? false) {
                Navigator.of(context, rootNavigator: true).pushNamed(route);
              } else {
                onClick?.call();
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle),
              child: image,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
                fontSize: 10,
                color: _textColor),
          )
        ],
      ),
    );
  }
}