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
  String weapon='권총';
  final weapons=const [
    ('권총','빠른 연사','●●○'),
    ('장총','강한 한발','●●●'),
    ('새총','코믹 타격','●●○'),
    ('젓가락','고급 기술','●●●'),
  ];

  IconData weaponIcon(String name)=>switch(name){
    '권총'=>Icons.gps_fixed,
    '장총'=>Icons.my_location,
    '새총'=>Icons.sports_baseball,
    _=>Icons.restaurant,
  };

  @override Widget build(BuildContext context)=>Scaffold(
    body:Container(
      decoration:const BoxDecoration(
        gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,
          colors:[Color(0xff071b2d),Color(0xff0c314d),Color(0xff06131d)])),
      child:SafeArea(child:Padding(padding:const EdgeInsets.fromLTRB(18,18,18,16),child:Column(children:[
        const Spacer(flex:2),
        Container(width:76,height:76,decoration:BoxDecoration(shape:BoxShape.circle,border:Border.all(color:const Color(0xffff3b30),width:4)),
          child:const Icon(Icons.bug_report,size:46,color:Colors.white)),
        const SizedBox(height:12),
        const Text('해충 박멸',style:TextStyle(fontSize:42,fontWeight:FontWeight.w900,letterSpacing:-2)),
        const Text('번호 순서대로 해충을 명중시키세요',style:TextStyle(fontSize:15,color:Colors.white70)),
        const SizedBox(height:22),
        const Align(alignment:Alignment.centerLeft,child:Text('무기 선택',style:TextStyle(fontSize:22,fontWeight:FontWeight.w900))),
        const SizedBox(height:10),
        GridView.count(
          shrinkWrap:true,crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing:10,childAspectRatio:1.55,
          physics:const NeverScrollableScrollPhysics(),
          children:weapons.map((w){
            final selected=weapon==w.$1;
            return InkWell(borderRadius:BorderRadius.circular(18),onTap:()=>setState(()=>weapon=w.$1),
              child:AnimatedContainer(duration:const Duration(milliseconds:120),padding:const EdgeInsets.all(13),
                decoration:BoxDecoration(
                  gradient:LinearGradient(colors:selected?[const Color(0xff1b6382),const Color(0xff143e59)]:[const Color(0xff102738),const Color(0xff0b1d2a)]),
                  borderRadius:BorderRadius.circular(18),
                  border:Border.all(color:selected?const Color(0xffffc400):Colors.white24,width:selected?2.5:1.2),
                  boxShadow:selected?[const BoxShadow(color:Color(0x44ffc400),blurRadius:16)]:null),
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children:[
                  Row(children:[Icon(weaponIcon(w.$1),size:29,color:selected?const Color(0xffffc400):Colors.white),
                    const Spacer(),if(selected)const Icon(Icons.check_circle,color:Color(0xffffc400),size:20)]),
                  const SizedBox(height:8),
                  Text(w.$1,style:const TextStyle(fontSize:20,fontWeight:FontWeight.w900)),
                  Text(w.$2,style:const TextStyle(fontSize:12,color:Colors.white60)),
                ])));
          }).toList()),
        const SizedBox(height:16),
        SizedBox(width:double.infinity,height:58,child:FilledButton(
          style:FilledButton.styleFrom(backgroundColor:const Color(0xffffc400),foregroundColor:Colors.black,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(18))),
          onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>GameScreen(weapon:weapon))),
          child:Text('$weapon으로 시작',style:const TextStyle(fontSize:19,fontWeight:FontWeight.w900)))),
        const SizedBox(height:10),
        Row(children:[
          Expanded(child:OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.emoji_events_outlined),label:const Text('기록'))),
          const SizedBox(width:10),
          Expanded(child:OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.settings_outlined),label:const Text('설정')))
        ]),
        const Spacer(flex:2),
        const Text('파리 · 모기 · 초파리  /  각 10단계',style:TextStyle(color:Colors.white54))
      ]))),
    ));
}
