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
        scaffoldBackgroundColor: const Color(0xffeaf8ff),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff43c3ff),
          brightness: Brightness.light,
        ),
        fontFamilyFallback: const ['Noto Sans KR', 'sans-serif'],
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
            colors: [Color(0xffa7e4ff), Color(0xffdef6ff), Color(0xfff7fbf4)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -44,
              right: -68,
              child: _SoftCircle(size: 220, color: Colors.white.withOpacity(.28)),
            ),
            Positioned(
              top: 120,
              left: -50,
              child: _SoftCircle(size: 150, color: Colors.white.withOpacity(.22)),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _TopHeader(),
                    const SizedBox(height: 16),
                    const _StoryHeroCard(),
                    const SizedBox(height: 16),
                    const _MissionCard(),
                    const SizedBox(height: 16),
                    const _WaveRoadMapCard(),
                    const SizedBox(height: 16),
                    const _BattleRuleCard(),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 68,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xffffca1f),
                          foregroundColor: const Color(0xff13212d),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const GameScreen()),
                          );
                        },
                        child: const Text(
                          '박멸 시작',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '실전형 아트 시스템 · 홈/플레이/결과 UI · 해충별 10단계 · 장총 중심 전투',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.4,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff67879a),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  final double size;
  final Color color;
  const _SoftCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(color: Color(0x16003d56), blurRadius: 18, offset: Offset(0, 8)),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/game_art/ui/app_icon.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '해충 박멸',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff14344e),
                  letterSpacing: -1.2,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '해충이 들끓기 시작했습니다. 해충을 박멸하여 마을을 구하세요.',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff496a80),
                  height: 1.35,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _MiniChip(label: '캐주얼 슈팅'),
                  _MiniChip(label: '순서 기억'),
                  _MiniChip(label: '웨이브 성장'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MiniChip extends StatelessWidget {
  final String label;
  const _MiniChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.85),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xffb9dff1), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w900,
          color: Color(0xff2d5a73),
        ),
      ),
    );
  }
}

class _StoryHeroCard extends StatelessWidget {
  const _StoryHeroCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: AspectRatio(
        aspectRatio: 16 / 13,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/game_art/backgrounds/hero_story.png', fit: BoxFit.cover),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.10),
                    Colors.black.withOpacity(.30),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.92),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'FINAL MASTER · WORLD 01',
                  style: TextStyle(
                    color: Color(0xff173650),
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: _HeroCopyPanel(),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCopyPanel extends StatelessWidget {
  const _HeroCopyPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.90),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '장총을 들고 마을을 지켜라!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xff173650)),
          ),
          SizedBox(height: 6),
          Text(
            '파리부터 시작해 모기, 나방, 혼합 웨이브까지 단계적으로 올라갑니다. 번호 순서를 정확히 따라가며 반응 속도와 집중력을 시험하세요.',
            style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w700, color: Color(0xff4e6778)),
          ),
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: const Color(0xf9ffffff),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x804bb5ff), width: 1.25),
        boxShadow: const [
          BoxShadow(color: Color(0x18005f8f), blurRadius: 20, offset: Offset(0, 8)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _EmojiBadge('🎯'),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '메인 미션',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xff13364d)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '해충이 들끓기 시작했습니다. 해충을 박멸하여 마을을 구하세요.',
            style: TextStyle(fontSize: 20, height: 1.45, fontWeight: FontWeight.w900, color: Color(0xff14344e)),
          ),
          SizedBox(height: 10),
          Text(
            '해충마다 10단계씩 구성되며 단계가 올라갈수록 출현 수, 속도, 이동 패턴이 더 까다로워집니다. 순서를 놓치거나 MISS가 3회 누적되면 2단계 후퇴합니다.',
            style: TextStyle(fontSize: 14.5, height: 1.58, fontWeight: FontWeight.w700, color: Color(0xff547184)),
          ),
        ],
      ),
    );
  }
}

class _EmojiBadge extends StatelessWidget {
  final String emoji;
  const _EmojiBadge(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xfffff4c5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(emoji, style: const TextStyle(fontSize: 18)),
    );
  }
}

class _WaveRoadMapCard extends StatelessWidget {
  const _WaveRoadMapCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xeeffffff),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x6aa5d8ef), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '웨이브 로드맵',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xff14344e)),
          ),
          SizedBox(height: 4),
          Text(
            '해충별 10단계씩 진행되는 최종 마스터 구조',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xff648296)),
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _PestStageCard(index: '1', title: '파리', subtitle: '기본형 · 리듬 적응', asset: 'assets/game_art/pests/fly.png', accent: Color(0xffff8e75))),
              SizedBox(width: 10),
              Expanded(child: _PestStageCard(index: '2', title: '모기', subtitle: '민첩형 · 빠른 궤도', asset: 'assets/game_art/pests/mosquito.png', accent: Color(0xff57c7ff))),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _PestStageCard(index: '3', title: '나방', subtitle: '확장형 · 시야 압박', asset: 'assets/game_art/pests/moth.png', accent: Color(0xffffd163))),
              SizedBox(width: 10),
              Expanded(child: _MixedWaveCard()),
            ],
          ),
        ],
      ),
    );
  }
}

class _PestStageCard extends StatelessWidget {
  final String index;
  final String title;
  final String subtitle;
  final String asset;
  final Color accent;

  const _PestStageCard({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.asset,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withOpacity(.75), width: 1.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: accent.withOpacity(.18), shape: BoxShape.circle),
                child: Text(index, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: accent)),
              ),
              const Spacer(),
              SizedBox(height: 40, width: 52, child: Image.asset(asset, fit: BoxFit.contain)),
            ],
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(fontSize: 12.6, fontWeight: FontWeight.w700, color: Color(0xff6e8898), height: 1.3)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: accent.withOpacity(.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text('10단계', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w900, color: Color(0xff30546c))),
          ),
        ],
      ),
    );
  }
}

class _MixedWaveCard extends StatelessWidget {
  const _MixedWaveCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xff6dd58d).withOpacity(.8), width: 1.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: const Color(0xff6dd58d).withOpacity(.18), shape: BoxShape.circle),
                child: const Text('4', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Color(0xff49b66d))),
              ),
              const Spacer(),
              SizedBox(
                width: 58,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(left: 0, top: 6, child: SizedBox(width: 20, child: Image.asset('assets/game_art/pests/fly.png'))),
                    Positioned(right: 2, top: 0, child: SizedBox(width: 20, child: Image.asset('assets/game_art/pests/mosquito.png'))),
                    Positioned(left: 18, bottom: 0, child: SizedBox(width: 24, child: Image.asset('assets/game_art/pests/moth.png'))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text('혼합', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          const Text('복합형 · 판단력 압박', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w700, color: Color(0xff6e8898), height: 1.3)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xff6dd58d).withOpacity(.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text('10단계', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w900, color: Color(0xff30546c))),
          ),
        ],
      ),
    );
  }
}

class _BattleRuleCard extends StatelessWidget {
  const _BattleRuleCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xeefffef8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x66e7df9b), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('전투 규칙', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: Color(0xff14344e))),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _RulePill(label: '번호 순서대로 터치', accent: Color(0xffffbd2e)),
              _RulePill(label: '파리/모기/나방/혼합 10단계', accent: Color(0xff62c9ff)),
              _RulePill(label: 'MISS 3회 누적 시 실패', accent: Color(0xffff8f76)),
              _RulePill(label: '실패 시 2단계 후퇴', accent: Color(0xff7ecf92)),
              _RulePill(label: '장총 1종 중심 전투', accent: Color(0xff9382ff)),
              _RulePill(label: '즉시 터치 판정', accent: Color(0xff86d9bd)),
            ],
          ),
        ],
      ),
    );
  }
}

class _RulePill extends StatelessWidget {
  final String label;
  final Color accent;
  const _RulePill({required this.label, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accent.withOpacity(.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: accent.withOpacity(.45), width: 1.1),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12.7, fontWeight: FontWeight.w900, color: Color(0xff23465d)),
      ),
    );
  }
}
