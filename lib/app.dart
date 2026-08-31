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
            colors: [Color(0xff9addff), Color(0xffeefbff), Color(0xfff7fcf3)],
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
                    const SizedBox(height: 8),
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
                        child: const Icon(
                          Icons.pest_control_rodent_rounded,
                          size: 58,
                          color: Color(0xff18334d),
                        ),
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
                            '해충이 들끓기 시작했습니다.',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xff173650)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '해충을 박멸하여 마을을 구하세요.',
                            style: TextStyle(fontSize: 15.5, height: 1.55, color: Color(0xff49667c), fontWeight: FontWeight.w700),
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
                        boxShadow: const [
                          BoxShadow(color: Color(0x12005f8f), blurRadius: 18, offset: Offset(0, 8)),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Expanded(child: _PhaseCard(name: '파리', color: Color(0xffff8d76), type: PestType.fly)),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(name: '모기', color: Color(0xff44c0ff), type: PestType.mosquito)),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(name: '나방', color: Color(0xffffd15f), type: PestType.moth)),
                          SizedBox(width: 8),
                          Expanded(child: _PhaseCard(name: '혼합', color: Color(0xff5bd07f), type: PestType.mixed)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        '순서를 놓치거나 MISS가 3회 누적되면 2단계 후퇴',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.5, color: Color(0xff6f8ea1), fontWeight: FontWeight.w700),
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

enum PestType { fly, mosquito, moth, mixed }

class _PhaseCard extends StatelessWidget {
  final String name;
  final Color color;
  final PestType type;
  const _PhaseCard({required this.name, required this.color, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(.78), width: 1.7),
      ),
      child: Column(
        children: [
          SizedBox(height: 38, child: Center(child: _PestGlyph(type: type))),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w900, color: Color(0xff173650))),
          const SizedBox(height: 2),
          const Text('10단계', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: Color(0xff678094))),
        ],
      ),
    );
  }
}

class _PestGlyph extends StatelessWidget {
  final PestType type;
  const _PestGlyph({required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == PestType.mixed) {
      return SizedBox(
        width: 40,
        height: 34,
        child: Stack(
          alignment: Alignment.center,
          children: const [
            Positioned(left: 0, top: 8, child: _FlyGlyph(scale: .62)),
            Positioned(right: 2, top: 1, child: _MosquitoGlyph(scale: .58)),
            Positioned(bottom: 0, child: _MothGlyph(scale: .62)),
          ],
        ),
      );
    }
    return switch (type) {
      PestType.fly => const _FlyGlyph(),
      PestType.mosquito => const _MosquitoGlyph(),
      PestType.moth => const _MothGlyph(),
      PestType.mixed => const SizedBox.shrink(),
    };
  }
}

class _FlyGlyph extends StatelessWidget {
  final double scale;
  const _FlyGlyph({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: 34,
        height: 28,
        child: Stack(
          children: [
            Positioned(left: 4, top: 5, child: _Wing(width: 11, height: 14, angle: -0.6)),
            Positioned(right: 4, top: 5, child: _Wing(width: 11, height: 14, angle: 0.6)),
            Positioned(left: 10, top: 8, child: Container(width: 14, height: 16, decoration: const BoxDecoration(color: Color(0xff253845), shape: BoxShape.circle))),
            Positioned(left: 5, top: 6, child: _EyeBubble(size: 8)),
            Positioned(right: 5, top: 6, child: _EyeBubble(size: 8)),
          ],
        ),
      ),
    );
  }
}

class _MosquitoGlyph extends StatelessWidget {
  final double scale;
  const _MosquitoGlyph({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: 36,
        height: 26,
        child: Stack(
          children: [
            Positioned(left: 1, top: 2, child: _Wing(width: 13, height: 8, angle: -0.9)),
            Positioned(right: 1, top: 2, child: _Wing(width: 13, height: 8, angle: 0.9)),
            Positioned(left: 15, top: 3, child: Container(width: 6, height: 17, decoration: BoxDecoration(color: const Color(0xff293c47), borderRadius: BorderRadius.circular(10)))),
            Positioned(left: 12, top: 1, child: Container(width: 12, height: 8, decoration: const BoxDecoration(color: Color(0xff324651), shape: BoxShape.circle))),
            Positioned(left: 15, top: -1, child: Container(width: 2, height: 8, decoration: BoxDecoration(color: const Color(0xff324651), borderRadius: BorderRadius.circular(2)))),
            Positioned(left: 10, top: 2, child: _EyeBubble(size: 7)),
            Positioned(right: 10, top: 2, child: _EyeBubble(size: 7)),
          ],
        ),
      ),
    );
  }
}

class _MothGlyph extends StatelessWidget {
  final double scale;
  const _MothGlyph({this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: 36,
        height: 28,
        child: Stack(
          children: [
            Positioned(left: 2, top: 4, child: _MothWing(left: true)),
            Positioned(right: 2, top: 4, child: _MothWing(left: false)),
            Positioned(left: 14, top: 6, child: Container(width: 8, height: 15, decoration: BoxDecoration(color: const Color(0xff66523f), borderRadius: BorderRadius.circular(8)))),
          ],
        ),
      ),
    );
  }
}

class _Wing extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  const _Wing({required this.width, required this.height, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xfffefefe), Color(0xffcce8fb)]),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffa5cde4), width: 1),
        ),
      ),
    );
  }
}

class _EyeBubble extends StatelessWidget {
  final double size;
  const _EyeBubble({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(-0.2, -0.2),
          colors: [Color(0xffffd5cb), Color(0xffff997b), Color(0xffef614a)],
        ),
      ),
    );
  }
}

class _MothWing extends StatelessWidget {
  final bool left;
  const _MothWing({required this.left});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: left ? -0.45 : 0.45,
      child: Container(
        width: 14,
        height: 18,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xffffefbe), Color(0xffe2c36e)]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffc59a42), width: 1.2),
        ),
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
