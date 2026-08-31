import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameScreen extends StatefulWidget {
  final String weapon;
  const GameScreen({super.key, required this.weapon});
  @override State<GameScreen> createState()=>_GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  late final WebViewController controller;
  @override void initState(){super.initState();controller=WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.black)
    ..loadFlutterAsset('assets/web/game.html');}
  @override Widget build(BuildContext context)=>Scaffold(
    body:SafeArea(child:Stack(children:[
      WebViewWidget(controller:controller),
      Positioned(top:8,left:8,child:IconButton.filledTonal(onPressed:()=>Navigator.pop(context),icon:const Icon(Icons.arrow_back))),
      Positioned(top:12,right:12,child:Chip(label:Text(widget.weapon))),
    ])));
}
