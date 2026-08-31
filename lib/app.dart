import 'package:flutter/material.dart';
import 'game_screen.dart';

class PestEradicationApp extends StatelessWidget {
  const PestEradicationApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '해충 박멸',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3fb0ff)),
          scaffoldBackgroundColor: const Color(0xffdff4ff),
        ),
        home: const HomeScreen(),
      );
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
            colors: [
              Color(0xff9addff),
              Color(0xffeefbff),
              Color(0xfff6fbf2),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const _SkyDecor(),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 102,
                        height: 102,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffff6e5a), width: 6),
                          boxShadow: const [
                            BoxShadow(color: Color(0x33ff855e), blurRadius: 24, offset: Offset(0, 12)),
                          ],
                        ),
                        child: const Icon(Icons.pest_control_rodent_rounded, size: 58, color: Color(0xff18334d)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        '해충 박멸',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff12314b),
                          letterSpacing: -1.8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '움직이는 해충을 번호 순서대로 명중시키세요',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.45,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff34586f),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                      decoration: BoxDecoration(
                        color: const Color(0xf9ffffff),
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: const Color(0x803fb0ff), width: 1.4),
                        boxShadow: const [
                          BoxShadow(color: Color(0x22005f8f), blurRadius: 20, offset: Offset(0, 12)),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _BadgeRow(),
                          SizedBox(height: 14),
                          Text(
                            '마을에 해충이 들끓기 시작했습니다.',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xff173650)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '파리부터 시작해 모기, 나방, 혼합형 웨이브까지 차례로 진행합니다. 해충마다 10단계씩 구성되며, 단계가 올라갈수록 속도와 움직임 패턴이 더 까다로워집니다. 순서를 놓치거나 MISS가 3회 누적되면 2단계 후퇴합니다.',
                            style: TextStyle(fontSize: 14.5, height: 1.58, color: Color(0xff49667c), fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _MiniTag(text: '파리 10단계'),
                              _MiniTag(text: '모기 10단계'),
                              _MiniTag(text: '나방 10단계'),
                              _MiniTag(text: '혼합 웨이브'),
                              _MiniTag(text: 'MISS 3회 실패'),
                              _MiniTag(text: '실패 시 2단계 후퇴'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xddf4fcff),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0x664bb5ff)),
                      ),
                      child: const Row(
                        children: [
                          Expanded(child: _PhaseCard(title: '1', name: '파리', color: Color(0xffff8d76))),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(title: '2', name: '모기', color: Color(0xff44c0ff))),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(title: '3', name: '나방', color: Color(0xffffd15f))),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(title: '4', name: '혼합', color: Color(0xff5bd07f))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 64,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xffffc928),
                          foregroundColor: const Color(0xff172028),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                          elevation: 4,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const GameScreen()),
                        ),
                        child: const Text(
                          '박멸 시작',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Center(
                      child: Text(
                        '파리 → 모기 → 나방 → 혼합형으로 이어지는 단계별 반응속도 게임',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.5, color: Color(0xff5c7e93), fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeRow extends StatelessWidget {
  const _BadgeRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _TinyRoundBadge(icon: Icons.gps_fixed_rounded, color: Color(0xffff7059)),
        SizedBox(width: 8),
        _TinyRoundBadge(icon: Icons.flash_on_rounded, color: Color(0xffffc928)),
        SizedBox(width: 8),
        _TinyRoundBadge(icon: Icons.bug_report_rounded, color: Color(0xff31b26d)),
      ],
    );
  }
}

class _TinyRoundBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _TinyRoundBadge({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(icon, color: color, size: 19),
    );
  }
}

class _MiniTag extends StatelessWidget {
  final String text;
  const _MiniTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffecf8ff),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x663f9fe3)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800, color: Color(0xff1e5a78))),
    );
  }
}

class _PhaseCard extends StatelessWidget {
  final String title;
  final String name;
  final Color color;
  const _PhaseCard({required this.title, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(.7), width: 1.5),
      ),
      child: Column(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          const Text('10단계', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: Color(0xff678094))),
        ],
      ),
    );
  }
}

class _SkyDecor extends StatelessWidget {
  const _SkyDecor();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 34,
            right: -34,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x46ffffff)),
            ),
          ),
          Positioned(
            top: 132,
            left: -18,
            child: Container(
              width: 114,
              height: 114,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x30ffffff)),
            ),
          ),
          Positioned(
            top: 102,
            left: 26,
            child: Container(
              width: 134,
              height: 48,
              decoration: BoxDecoration(color: const Color(0x82ffffff), borderRadius: BorderRadius.circular(40)),
            ),
          ),
          Positioned(
            top: 84,
            left: 54,
            child: Container(width: 54, height: 54, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x82ffffff))),
          ),
          Positioned(
            top: 90,
            left: 94,
            child: Container(width: 62, height: 62, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x82ffffff))),
          ),
        ],
      ),
    );
  }
}
