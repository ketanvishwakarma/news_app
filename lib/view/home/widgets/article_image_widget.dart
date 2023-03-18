import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleImageWidget extends StatelessWidget {
  const ArticleImageWidget({
    required this.path,
    this.width,
    this.height,
    super.key,
  });

  final String? path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      color: colorScheme.primary.withOpacity(0.2),
      child: path == null
          ? const Icon(CupertinoIcons.photo)
          : CachedNetworkImage(
              imageUrl: path!,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return const Icon(CupertinoIcons.photo);
              },
            ),
    );
  }
}
