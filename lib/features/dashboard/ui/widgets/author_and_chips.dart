import 'package:flutter/material.dart';
import 'package:pixabay_web/features/dashboard/domain/entity/photo_entity.dart';

class AuthorAndChips extends StatelessWidget {
  final PhotoEntity photo;

  const AuthorAndChips({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tags = (photo.tags ?? <String>[]);
        final maxVisible = constraints.maxWidth >= 350
            ? 6
            : constraints.maxWidth >= 260
                ? 5
                : constraints.maxWidth >= 200
                    ? 4
                    : 1;

        final visible = tags.take(maxVisible).toList();
        final overflowCount = tags.length - visible.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person,
                        size: 12.0, color: Colors.grey)),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    photo.photographerName ?? 'Unknown',
                    // "W: ${constraints.maxWidth.toInt()}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: [
                    for (final t in visible) _buildTagChip(t, context),
                    if (overflowCount > 0)
                      InkWell(
                        onTap: () => _showAllTags(context, tags),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '+ $overflowCount',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTagChip(String tag, BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 11.0, color: Colors.black87),
      ),
    );
  }

  void _showAllTags(BuildContext context, List<String> tags) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((t) {
                return _buildTagChip(t, context);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
