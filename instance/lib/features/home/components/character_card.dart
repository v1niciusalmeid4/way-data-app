import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;
  final Function(int id) onCharacterPressed;

  const CharacterCard({
    required this.character,
    required this.onCharacterPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusStyle = theme.textTheme.labelMedium?.copyWith(
      color: character.status.getUIData(context).foreground,
      fontWeight: FontWeight.w600,
    );

    return InkWell(
      onTap: () => onCharacterPressed(character.id),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: theme.colorScheme.surface,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  loadingBuilder: (ctx, child, loading) {
                    if (loading == null) return child;
                    return CircularProgressIndicator.adaptive();
                  },
                  errorBuilder: (ctx, err, st) => Container(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: .6,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.person, size: 28),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      StatusChip(
                        label: character.status.label,
                        foreground: character.status
                            .getUIData(context)
                            .foreground,
                        style: statusStyle,
                      ),
                      Text('•', style: theme.textTheme.bodySmall),
                      Text(
                        character.species,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text('·', style: theme.textTheme.bodySmall),
                      Text(
                        character.gender.label,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Última localização',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    character.location.name,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
