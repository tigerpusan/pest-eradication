import 'package:flutter/material.dart';
import 'game_screen.dart';

class PestEradicationApp extends StatelessWidget {
  const PestEradicationApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '해충 박멸',
    theme: ThemeData.dark(useMaterial3: true),
    home: const HomeScreen(),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String weapon='장총';
  final weapons=const [('권총','🔫'),('장총','🎯'),('새총','🪃'),('젓가락','🥢')];
  @override Widget build(BuildContext context)=>Scaffold(
    body:Container(
      decoration:const BoxDecoration(gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,colors:[Color(0xff14334c),Color(0xff07131c)])),
      child:SafeArea(child:Padding(padding:const EdgeInsets.all(20),child:Column(children:[
        const Spacer(), const Text('해충 박멸',style:TextStyle(fontSize:42,fontWeight:FontWeight.w900)),
        const SizedBox(height:8),const Text('번호 순서대로 해충을 명중시키세요',style:TextStyle(fontSize:16)),
        const SizedBox(height:28),const Align(alignment:Alignment.centerLeft,child:Text('무기 선택',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold))),
        const SizedBox(height:10),
        GridView.count(shrinkWrap:true,crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing:10,childAspectRatio:2.1,physics:const NeverScrollableScrollPhysics(),
          children:weapons.map((w)=>InkWell(onTap:()=>setState(()=>weapon=w.$1),child:Container(
            decoration:BoxDecoration(color:weapon==w.$1?const Color(0xff244f69):const Color(0xff152733),borderRadius:BorderRadius.circular(16),border:Border.all(color:weapon==w.$1?Colors.amber:Colors.white24,width:2)),
            child:Center(child:Text('${w.$2}  ${w.$1}',style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)))))).toList()),
        const SizedBox(height:18),
        SizedBox(width:double.infinity,height:58,child:FilledButton(style:FilledButton.styleFrom(backgroundColor:Colors.amber,foregroundColor:Colors.black),onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>GameScreen(weapon:weapon))),child:const Text('해충잡기 시작',style:TextStyle(fontSize:20,fontWeight:FontWeight.w900)))),
        const SizedBox(height:12),
        Row(children:[Expanded(child:OutlinedButton(onPressed:(){},child:const Text('기록'))),const SizedBox(width:10),Expanded(child:OutlinedButton(onPressed:(){},child:const Text('설정')))]),
        const Spacer(),
        const Text('파리 · 모기 · 초파리 / 각 10단계',style:TextStyle(color:Colors.white60))
      ]))),
    ));
}
