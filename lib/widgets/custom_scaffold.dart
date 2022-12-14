import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final VoidCallback? appBarOnPressedLeading;
  final Color? appBarLeadingColor;
  final Color? appBarLeadingBackgroundColor;
  final Widget body;
  final bool? resizeToAvoidBottomInset;

  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const CustomScaffold(
      {Key? key,
      this.padding,
      this.backgroundColor,
      this.appBar,
      this.appBarOnPressedLeading,
      this.appBarLeadingColor,
      this.appBarLeadingBackgroundColor,
      required this.body,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTapDown: (value) {},
        child: Container(
          // height: ResponsiveFlutter.of(context).hp(100),
          // padding: padding ??
          //     EdgeInsets.only(
          //         top: ResponsiveFlutter.of(context).fontSize(13),
          //         right: ResponsiveFlutter.of(context).fontSize(5),
          //         left: ResponsiveFlutter.of(context).fontSize(5),
          //         bottom: ResponsiveFlutter.of(context).fontSize(2)),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/baekseol.png'), fit: BoxFit.fill),
          ), //todo need to change
          child: body,
        ),
      ),
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
    return scaffold;
  }
}
