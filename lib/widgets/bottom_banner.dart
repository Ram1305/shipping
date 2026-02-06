import 'package:flutter/material.dart';
import '../utils/colors.dart';

/// Bottom banner: 8 images in a horizontal row with continuous auto-scroll.
class BottomBanner extends StatefulWidget {
  final List<String> bannerPaths;

  const BottomBanner({
    super.key,
    required this.bannerPaths,
  });

  static const int _visibleCount = 4;
  static const int _maxItems = 8;
  static const int _scrollDurationSeconds = 25;

  @override
  State<BottomBanner> createState() => _BottomBannerState();
}

class _BottomBannerState extends State<BottomBanner> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  double _itemWidth = 0;
  bool _scrollListenerAdded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: BottomBanner._scrollDurationSeconds),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  double _itemWidthFor(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    const horizontalPadding = 8.0 * 2;
    const gapBetweenItems = 6.0 * 2 * (BottomBanner._visibleCount - 1);
    return (screenWidth - horizontalPadding - gapBetweenItems) / BottomBanner._visibleCount;
  }

  void _onScrollTick() {
    if (!_scrollController.hasClients || _itemWidth <= 0) return;
    final oneSetWidth = BottomBanner._maxItems * (_itemWidth + 6 * 2);
    final offset = _animationController.value * oneSetWidth;
    _scrollController.jumpTo(offset);
    if (_animationController.value >= 0.999) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    _itemWidth = _itemWidthFor(context);
    final paths = widget.bannerPaths.length >= BottomBanner._maxItems
        ? widget.bannerPaths.take(BottomBanner._maxItems).toList()
        : List.generate(BottomBanner._maxItems, (i) => i < widget.bannerPaths.length ? widget.bannerPaths[i] : widget.bannerPaths.isNotEmpty ? widget.bannerPaths.first : '');

    if (_itemWidth > 0 && !_scrollListenerAdded) {
      _scrollListenerAdded = true;
      _animationController.addListener(_onScrollTick);
    }

    final duplicatedPaths = [...paths, ...paths];

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: duplicatedPaths.map((bannerPath) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SizedBox(
                width: _itemWidth,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: bannerPath.isNotEmpty
                        ? Image.asset(
                            bannerPath,
                            fit: BoxFit.contain,
                            // width: double.infinity,
                            // height: double.infinity,
                            errorBuilder: (_, __, ___) => _placeholder(),
                          )
                        : _placeholder(),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.borderColor,
      child: const Center(
        child: Icon(Icons.image_outlined, color: AppColors.textSecondary, size: 32),
      ),
    );
  }
}
