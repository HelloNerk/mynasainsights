import 'package:flutter/material.dart';
import '../../data/local/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.favorite,
    required this.onDelete,
  });

  final FavoriteModel favorite;
  final Function() onDelete;



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                favorite.url,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Text(
              favorite.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Version:'),
                const SizedBox(width: 6),
                Text(
                  favorite.serviceVersion,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Copyright
            Row(
              children: [
                const Icon(Icons.copyright, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  favorite.copyright.isNotEmpty ?? false
                      ? favorite.copyright
                      : 'Private Author',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Media Type: ${favorite.mediaType}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
