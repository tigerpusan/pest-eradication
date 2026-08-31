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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2aa6ff)),
          scaffoldBackgroundColor: const Color(0xffbfeaff),
          fontFamily: null,
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
              Color(0xff92dcff),
              Color(0xffdff7ff),
              Color(0xfff7fff2),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const _SkyDecor(),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffff5d49), width: 6),
                          boxShadow: const [
                            BoxShadow(color: Color(0x44ff725e), blurRadius: 22, offset: Offset(0, 10)),
                          ],
                        ),
                        child: const Icon(Icons.bug_report_rounded, size: 58, color: Color(0xff1f3142)),
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
                          height: 1.4,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff35556d),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                      decoration: BoxDecoration(
                        color: const Color(0xeefeffff),
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: const Color(0x662aa6ff), width: 1.4),
                        boxShadow: const [
                          BoxShadow(color: Color(0x26005f8f), blurRadius: 18, offset: Offset(0, 10)),
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
                            '가장 기본적인 파리부터 시작해, 점점 더 빠르고 교묘한 움직임을 보이는 해충들을 박멸하세요. 순서를 놓치면 실패합니다. 집중력과 반응속도로 끝까지 살아남으세요.',
                            style: TextStyle(fontSize: 14.5, height: 1.55, color: Color(0xff49667c), fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _MiniTag(text: '파리 1~10단계'),
                              _MiniTag(text: 'MISS 3회 실패'),
                              _MiniTag(text: '2단계 후퇴'),
                              _MiniTag(text: '즉시 터치 판정'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 62,
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
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: const Color(0xccffffff),
                              foregroundColor: const Color(0xff20415a),
                              side: const BorderSide(color: Color(0x663f9fe3), width: 1.2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () => _showInfo(context, '해충 도감', "현재 오픈된 해충\n\n• 기본 파리\n\n다음 패치 예고\n• 모기\n• 초파리\n\n해충별 특징과 출현 지역, 위험도 정보가 여기에 정리됩니다."),
                            icon: const Icon(Icons.menu_book_rounded),
                            label: const Text('도감', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: const Color(0xccffffff),
                              foregroundColor: const Color(0xff20415a),
                              side: const BorderSide(color: Color(0x663f9fe3), width: 1.2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () => _showInfo(context, '기록', "기본 포맷 안내\n\n• 최고 단계\n• 최고 점수\n• 총 박멸 수\n• 연속 명중 기록\n\n실제 기록 저장은 플레이 데이터 확장 패치에서 강화됩니다."),
                            icon: const Icon(Icons.emoji_events_rounded),
                            label: const Text('기록', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Center(
                      child: Text(
                        '밝은 캐주얼 패치 V0.1.4 · 파리 기본 스테이지 집중 버전',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.5, color: Color(0xff5e7c91), fontWeight: FontWeight.w700),
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

  static void _showInfo(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xfff8fdff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xff173650))),
        content: Text(body, style: const TextStyle(height: 1.55, color: Color(0xff4b6678), fontWeight: FontWeight.w600)),
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xffffc928),
              foregroundColor: const Color(0xff172028),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('확인', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
        ],
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
        color: const Color(0xffeaf8ff),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x663f9fe3)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800, color: Color(0xff1e5a78))),
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
            top: 36,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x55ffffff),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: -20,
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x33ffffff),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 26,
            child: Container(
              width: 128,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0x8fffffff),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 92,
            left: 54,
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x8fffffff)),
            ),
          ),
          Positioned(
            top: 98,
            left: 94,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x8fffffff)),
            ),
          ),
        ],
      ),
    );
  }
}
