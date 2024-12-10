import 'package:flutter/material.dart';
import '../../../favorites/data/local/favorite_dao.dart';
import '../../../favorites/data/local/favorite_model.dart';
import '../../domain/apod.dart';

class ApodListItem extends StatefulWidget {
  const ApodListItem({super.key, required this.item});
  final Apod item;

  @override
  State<ApodListItem> createState() => _ApodListItemState();
}

class _ApodListItemState extends State<ApodListItem> {
  bool _isFavorite = false;

  Future<void> _validateFavorite() async {
    bool favorite = await FavoriteDao().isFavorite(widget.item.date);
    setState(() {
      _isFavorite = favorite;
    });
  }

  @override
  void initState() {
    _validateFavorite();
    super.initState();
  }

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
                widget.item.url,
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
            // Título
            Text(
              widget.item.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            // Fecha
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  widget.item.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Descripción breve (máximo 3 líneas)
            Text(
              widget.item.explanation,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // Botón de favoritos
            Align(
              alignment: Alignment.centerRight,
              child: IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                    if (_isFavorite) {
                      FavoriteDao().insertFavorite(FavoriteModel(
                        id: null,
                        copyright: widget.item.copyright,
                        date: widget.item.date,
                        explanation: widget.item.explanation,
                        hdurl: widget.item.hdurl,
                        mediaType: widget.item.mediaType,
                        serviceVersion: widget.item.serviceVersion,
                        title: widget.item.title,
                        url: widget.item.url,
                      ));
                    } else {
                      FavoriteDao().deleteFavorite(widget.item.date);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavorite ? Colors.red : Colors.grey,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
