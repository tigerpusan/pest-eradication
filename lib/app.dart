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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff071b2d),
                Color(0xff0c314d),
                Color(0xff06131d),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffff3b30), width: 5),
                      boxShadow: const [BoxShadow(color: Color(0x55ff3b30), blurRadius: 24)],
                    ),
                    child: const Icon(Icons.bug_report, size: 56, color: Colors.white),
                  ),
                  const SizedBox(height: 18),
                  const Text('해충 박멸',
                      style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, letterSpacing: -2)),
                  const SizedBox(height: 10),
                  const Text('움직이는 파리를 번호 순서대로 명중시키세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70)),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xff102738),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Column(
                      children: [
                        Text('기본 포맷', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                        SizedBox(height: 8),
                        Text('장총 1종 고정 / 파리만 등장 / 단계가 올라갈수록 속도와 수량 증가',
                            textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.white70)),
                        SizedBox(height: 6),
                        Text('번호 순서대로 조준 · 발사',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xffffd54a))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xffffc400),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GameScreen()),
                      ),
                      child: const Text('게임 시작',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    ),
                  ),
                  const Spacer(flex: 3),
                  const Text('파리 1~10단계 / 기본 난이도 집중 버전',
                      style: TextStyle(color: Colors.white54, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      );
}
