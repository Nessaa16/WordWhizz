part of 'pages.dart';

abstract class BaseCustomDialog {
  // Title can be a widget, allowing flexibility for images or text
  Widget buildTitle(BuildContext context);

  // Content is customizable with different layouts
  Widget buildContent(BuildContext context);

  // Actions like buttons or other interactive widgets
  List<Widget> buildActions(BuildContext context);

  // Common dialog structure
  AlertDialog buildDialog(BuildContext context) {
    return AlertDialog(
      title: buildTitle(context),
      content: buildContent(context),
      actions: buildActions(context),
    );
  }
}