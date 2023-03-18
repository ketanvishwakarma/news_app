import 'package:flutter/material.dart';
import 'package:news_app/common_widgets/gradient_overlay_widget.dart';
import 'package:news_app/core/styles/app_sizes.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/models/article/article.dart';
import 'package:news_app/view/home/widgets/article_image_widget.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopCoverImage(
              path: article.urlToImage,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: textTheme.headlineSmall,
                  ),
                  gapHLarge,
                  if (article.description != null)
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.medium),
                        child: Text(
                          article.description!,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  gapHLarge,
                  Text(
                    'Published on ${article.publishedAt.formatToDateTime}',
                    style: textTheme.bodyMedium,
                  ),
                  gapHSmall,
                  Text(
                    'at ${article.source.name}',
                    style: textTheme.bodyMedium,
                  ),
                  if (article.author != null)
                    Text(
                      'By ${article.author!},',
                      style: textTheme.bodyMedium,
                    ),
                  gapHLarge,
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        launchWebsite(article.url);
                      },
                      child: const Text('Check out more'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCoverImage extends StatelessWidget {
  const TopCoverImage({
    required this.path,
    super.key,
  });

  final String? path;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 250,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ArticleImageWidget(path: path),
          GradientOverlayWidget(
            colors: [
              colorScheme.background,
              Colors.transparent,
              colorScheme.background,
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSizes.large * 2,
                left: AppSizes.medium,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
