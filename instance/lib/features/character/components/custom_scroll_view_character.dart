import 'package:flutter/material.dart';
import 'package:core/app_way_data_core.dart';

import 'sliver_app_bar_character_component.dart';

class CustomScrollViewCharacter extends StatelessWidget {
  final CharacterEntity character;
  final Function() onBackPressed;
  const CustomScrollViewCharacter({
    super.key,
    required this.character,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBarCharacterComponent(
          tag: character.id.toString(),
          onBackPressed: onBackPressed,
          url: character.image,
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  character.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                ),
              ),

              if ((character.species.isNotEmpty) || (character.type.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    '${character.gender.label} · ${character.type}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  CustomChip(
                    leading: const Icon(Icons.person_outline, size: 16),
                    label: '#${character.id}',
                  ),
                  CustomChip(
                    leading: Icon(
                      Icons.transgender,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                    label: character.gender.label,
                  ),
                ],
              ),

              VSpacer(),

              CharacterSection(
                title: 'Identidade',
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    InfoTile(
                      icon: Icons.badge_outlined,
                      label: 'ID',
                      value: '#${character.id}',
                    ),
                    InfoTile(
                      icon: Icons.transgender,
                      label: 'Gênero',
                      value: character.gender.label,
                    ),
                    InfoTile(
                      icon: Icons.favorite_outlined,
                      label: 'Status',
                      value: character.status.label,
                    ),
                    if (character.species.isNotEmpty)
                      InfoTile(
                        icon: Icons.pets_outlined,
                        label: 'Especie',
                        value: character.species,
                      ),
                    if (character.type.isNotEmpty)
                      InfoTile(
                        icon: Icons.category_outlined,
                        label: 'Tipo',
                        value: character.type,
                      ),
                  ],
                ),
              ),

              CharacterSection(
                title: 'Localizações',
                child: Column(
                  children: [
                    NavigationTile(
                      leadingIcon: Icons.public_outlined,
                      title: 'Origem',
                      subtitle: character.origin.name,
                    ),
                    Divider(),
                    NavigationTile(
                      leadingIcon: Icons.place_outlined,
                      title: 'Última localização conhecida',
                      subtitle: character.location.name,
                    ),
                  ],
                ),
              ),

              FullSizeLayoutButton(
                child: OutlinedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.ios_share),
                  label: const Text('Compartilhar'),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class CharacterSection extends StatelessWidget {
  final String title;
  final Widget child;

  const CharacterSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: theme.colorScheme.surface,
          child: Padding(padding: const EdgeInsets.all(12), child: child),
        ),
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? color;

  const InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 150),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: .35,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (color != null)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      Flexible(
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: color ?? theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subtitle;

  const NavigationTile({
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(
              leadingIcon,
              size: 22,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final Widget? leading;
  final String label;

  const CustomChip({this.leading, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: .4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            IconTheme(
              data: IconThemeData(color: theme.colorScheme.primary),
              child: leading!,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
