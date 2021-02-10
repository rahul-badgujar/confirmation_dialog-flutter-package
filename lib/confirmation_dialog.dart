library confirmation_dialog;

import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final Widget title;
  final TextStyle titleTextStyle;
  final List<Widget> children;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final double elevation;
  final String semanticLabel;
  final ShapeBorder shape;
  final Widget accepterWidget;
  final Widget rejectorWidget;

  /// Confirmation Dialog
  ///
  /// [title]: Title of Confirmation Dialog
  /// [children]: List of items to be included in content
  /// [backgroundColor]: Background Color of Dialog
  /// [elevation]: elevation for dialog
  /// [shape]: shape of Dialog
  /// [accepterWidget]: widget on clicked results Acceptance, cannot be null
  /// [rejectorWidget]: widget on clicked results Rejection, cannot be null
  /// [titlePadding]: padding for title, cannot be null
  /// [contentPadding]: padding for content, cannot be null
  const ConfirmationDialog({
    Key key,
    this.title,
    this.titleTextStyle,
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.children,
    @required this.accepterWidget,
    @required this.rejectorWidget,
  })  : assert(accepterWidget != null, "Accepter widget cannot be null"),
        assert(rejectorWidget != null, "Rejector widget cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title,
      titleTextStyle: titleTextStyle,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      backgroundColor: backgroundColor,
      elevation: elevation,
      semanticLabel: semanticLabel,
      shape: shape,
      children: children == null ? [] : children
        ..addAll([
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleDialogOption(
                child: accepterWidget,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              SimpleDialogOption(
                child: rejectorWidget,
                onPressed: () {
                  Navigator.pop(context, false);
                },
              )
            ],
          ),
        ]),
    );
  }
}
