import 'package:flutter/material.dart';

class CustomThemeSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Duration duration;

  const CustomThemeSwitch({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
    this.width = 72,
    this.height = 38,
    this.duration = const Duration(milliseconds: 350),
  });

  @override
  State<CustomThemeSwitch> createState() => _CustomThemeSwitchState();
}

class _CustomThemeSwitchState extends State<CustomThemeSwitch> with SingleTickerProviderStateMixin {
  late bool _isDark;
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDarkMode;
    _blinkController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    if (_isDark) _blinkController.repeat();
  }

  @override
  void didUpdateWidget(covariant CustomThemeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDarkMode != widget.isDarkMode) {
      setState(() => _isDark = widget.isDarkMode);
      if (_isDark) {
        _blinkController.repeat();
      } else {
        _blinkController.stop();
        _blinkController.reset();
      }
    }
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  void _handleTap() {
    final newValue = !_isDark;
    widget.onChanged(newValue);
    // local optimistic update: UI responds quickly, parent persists
    setState(() => _isDark = newValue);
    if (newValue) {
      _blinkController.repeat();
    } else {
      _blinkController.stop();
      _blinkController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final h = widget.height;
    final radius = h / 2;
    final padding = 4.0;
    final knobSize = h - padding * 2;
    final knobLeft = padding;
    final knobRight = w - knobSize - padding;

    return Semantics(
      button: true,
      label: 'Toggle theme',
      value: _isDark ? 'Dark mode' : 'Light mode',
      onTap: _handleTap,
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: widget.duration,
          width: w,
          height: h,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: _isDark
                ? LinearGradient(colors: [Colors.indigo[700]!, Colors.black87], begin: Alignment.topLeft, end: Alignment.bottomRight)
                : LinearGradient(colors: [Colors.yellow[100]!, Colors.orange[200]!], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: _isDark ? Colors.black45 : Colors.orange.withOpacity(0.25),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Optional tiny stars when dark
              if (_isDark)
                Positioned.fill(
                  child: FadeTransition(
                    opacity: CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
                    child: CustomPaint(
                      painter: _StarsPainter(),
                    ),
                  ),
                ),

              // sun & moon icons in background for subtle effect
              Positioned(
                left: 8,
                child: Opacity(
                  opacity: _isDark ? 0.0 : 1.0,
                  child: const Icon(Icons.wb_sunny, size: 14, color: Colors.orangeAccent),
                ),
              ),
              Positioned(
                right: 8,
                child: Opacity(
                  opacity: _isDark ? 1.0 : 0.0,
                  child: Icon(Icons.nights_stay, size: 14, color: Colors.white70),
                ),
              ),

              // knob
              AnimatedPositioned(
                duration: widget.duration,
                curve: Curves.decelerate,
                left: _isDark ? knobRight : knobLeft,
                child: Container(
                  width: knobSize,
                  height: knobSize,
                  decoration: BoxDecoration(
                    color: _isDark ? Colors.grey[200]!.withOpacity(0.12) : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _isDark ? Colors.black54 : Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: widget.duration,
                      transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                      child: _isDark
                          ? const Icon(Icons.nights_stay, key: ValueKey('moon'), size: 18, color: Colors.yellow)
                          : const Icon(Icons.wb_sunny, key: ValueKey('sun'), size: 18, color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.9);
    // simple tiny stars positions relative to size
    final points = [
      Offset(size.width * 0.25, size.height * 0.2),
      Offset(size.width * 0.4, size.height * 0.35),
      Offset(size.width * 0.7, size.height * 0.15),
    ];
    for (final p in points) {
      canvas.drawCircle(p, 1.6, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
