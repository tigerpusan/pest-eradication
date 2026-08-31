import 'package:flutter/material.dart';
import 'game_screen.dart';

class PestEradicationApp extends StatelessWidget {
  const PestEradicationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '해충 박멸',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff50c7ff)),
        scaffoldBackgroundColor: const Color(0xffdff4ff),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff9fe0ff), Color(0xffecfbff), Color(0xfff7fcf4)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Header(),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: AspectRatio(
                    aspectRatio: 9 / 13,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset('assets/game_art/hero_story.png', fit: BoxFit.cover),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black.withOpacity(.10), Colors.black.withOpacity(.22)],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          top: 18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.9),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              '스토리 모드',
                              style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xff19344d)),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 18,
                          right: 18,
                          bottom: 18,
                          child: _HeroCopy(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                  decoration: BoxDecoration(
                    color: const Color(0xf9ffffff),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0x804bb5ff), width: 1.3),
                    boxShadow: const [
                      BoxShadow(color: Color(0x16005f8f), blurRadius: 18, offset: Offset(0, 8)),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '해충이 들끓기 시작했습니다.',
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Color(0xff14344e)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '해충을 박멸하여 마을을 구하세요.',
                        style: TextStyle(fontSize: 16, height: 1.55, fontWeight: FontWeight.w700, color: Color(0xff456679)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xeefaffff),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0x664db5ff), width: 1.1),
                  ),
                  child: const Row(
                    children: [
                      Expanded(child: _PhaseCard(name: '파리', asset: 'assets/game_art/fly.png', accent: Color(0xffff8b74))),
                      SizedBox(width: 8),
                      Expanded(child: _PhaseCard(name: '모기', asset: 'assets/game_art/mosquito.png', accent: Color(0xff52c2ff))),
                      SizedBox(width: 8),
                      Expanded(child: _PhaseCard(name: '나방', asset: 'assets/game_art/moth.png', accent: Color(0xffffcf60))),
                      SizedBox(width: 8),
                      Expanded(child: _MixedCard()),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '순서를 놓치거나 MISS가 3회 누적되면 2단계 후퇴',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.8, color: Color(0xff6f8ea1), fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 64,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xffffc928),
                      foregroundColor: const Color(0xff141d24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GameScreen()),
                      );
                    },
                    child: const Text('박멸 시작', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  '파리 → 모기 → 나방 → 혼합형으로 이어지는 단계별 반응속도 게임',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.6, fontWeight: FontWeight.w700, color: Color(0xff5d7d91)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(color: Color(0x16000000), blurRadius: 12, offset: Offset(0, 8)),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/icon/app_icon.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '해충 박멸',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xff14344e), letterSpacing: -1.4),
              ),
              SizedBox(height: 4),
              Text(
                '움직이는 해충을 번호 순서대로 명중시키세요',
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700, color: Color(0xff48697c), height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.88),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '마을을 지켜라!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xff173650)),
          ),
          SizedBox(height: 6),
          Text(
            '파리부터 시작해 모기, 나방, 혼합 웨이브까지 차례로 돌파하세요. 화면을 스치듯 움직이는 해충을 정확한 순서로 맞히는 집중력 슈팅 게임입니다.',
            style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w700, color: Color(0xff4b6677)),
          ),
        ],
      ),
    );
  }
}

class _PhaseCard extends StatelessWidget {
  final String name;
  final String asset;
  final Color accent;

  const _PhaseCard({required this.name, required this.asset, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withOpacity(.8), width: 1.5),
      ),
      child: Column(
        children: [
          SizedBox(height: 58, child: Image.asset(asset, fit: BoxFit.contain)),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 14.2, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          const Text('10단계', style: TextStyle(fontSize: 11.2, fontWeight: FontWeight.w700, color: Color(0xff698094))),
        ],
      ),
    );
  }
}

class _MixedCard extends StatelessWidget {
  const _MixedCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xff69d77f).withOpacity(.9), width: 1.5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 58,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(left: 1, top: 8, child: SizedBox(width: 28, child: Image.asset('assets/game_art/fly.png'))),
                Positioned(right: 0, top: 4, child: SizedBox(width: 28, child: Image.asset('assets/game_art/mosquito.png'))),
                Positioned(bottom: 2, child: SizedBox(width: 34, child: Image.asset('assets/game_art/moth.png'))),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Text('혼합', style: TextStyle(fontSize: 14.2, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          const Text('10단계', style: TextStyle(fontSize: 11.2, fontWeight: FontWeight.w700, color: Color(0xff698094))),
        ],
      ),
    );
  }
}
