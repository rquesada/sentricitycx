import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.currentState,
    required this.statesPerPage,
  });

  final int currentPage;
  final int currentState;

  /// How many states each page has, e.g. [2, 2, 3]
  final List<int> statesPerPage;

  static const _activeColor = Color(0xFFFFFFFF);
  static const _inactiveColor = Color(0x54F6F6F6);
  static const _activeWidth = 120.0;
  static const _inactiveWidth = 116.0;
  static const _height = 4.0;
  static const _radius = 2.0;
  static const _gap = 6.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(statesPerPage.length, (pageIndex) {
        return Padding(
          padding: EdgeInsets.only(right: pageIndex < statesPerPage.length - 1 ? _gap : 0),
          child: _IndicatorBar(
            pageIndex: pageIndex,
            currentPage: currentPage,
            currentState: currentState,
            totalStates: statesPerPage[pageIndex],
          ),
        );
      }),
    );
  }
}

class _IndicatorBar extends StatelessWidget {
  const _IndicatorBar({
    required this.pageIndex,
    required this.currentPage,
    required this.currentState,
    required this.totalStates,
  });

  final int pageIndex;
  final int currentPage;
  final int currentState;
  final int totalStates;

  @override
  Widget build(BuildContext context) {
    final isPast = pageIndex < currentPage;
    final isActive = pageIndex == currentPage;

    // Progress: how much of this bar is filled (0.0 to 1.0)
    double progress;
    if (isPast) {
      progress = 1.0;
    } else if (isActive) {
      progress = (currentState + 1) / totalStates;
    } else {
      progress = 0.0;
    }

    return SizedBox(
      width: PageIndicator._activeWidth,
      height: PageIndicator._height,
      child: Stack(
        children: [
          // Inactive background
          Container(
            width: PageIndicator._inactiveWidth,
            height: PageIndicator._height,
            decoration: BoxDecoration(
              color: PageIndicator._inactiveColor,
              borderRadius: BorderRadius.circular(PageIndicator._radius),
            ),
          ),
          // Animated white fill
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: PageIndicator._activeWidth * progress,
            height: PageIndicator._height,
            decoration: BoxDecoration(
              color: PageIndicator._activeColor,
              borderRadius: BorderRadius.circular(PageIndicator._radius),
            ),
          ),
        ],
      ),
    );
  }
}
