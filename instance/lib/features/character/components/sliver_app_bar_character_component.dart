import 'package:flutter/material.dart';

class SliverAppBarCharacterComponent extends StatelessWidget {
  final String tag;
  final String url;

  const SliverAppBarCharacterComponent({
    required this.tag,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 320,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.maybePop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.color_lens_outlined),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        titlePadding: const EdgeInsets.only(left: 56, bottom: 12, right: 16),
        background: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: tag,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: .3),
                    );
                  },
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: .5,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image_outlined, size: 40),
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0x33000000),
                      Color(0x66000000),
                    ],
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
