import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/bookmark_list/bookmark_list_bloc.dart';
import 'package:news_app/common_widgets/gradient_overlay_widget.dart';
import 'package:news_app/core/styles/app_sizes.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/models/article/article.dart';
import 'package:news_app/view/article_details/article_details_screen.dart';
import 'package:news_app/view/home/widgets/article_image_widget.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.article,
    this.showBookmark = true,
    super.key,
  });

  final Article article;
  final bool showBookmark;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<ArticleDetailsScreen>(
            builder: (context) {
              return ArticleDetailsScreen(article: article);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(AppSizes.medium),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSizes.large),
        ),
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.large),
              child: ArticleImageWidget(
                path: article.urlToImage,
              ),
            ),
            GradientOverlayWidget(
              borderRadius: BorderRadius.circular(AppSizes.large),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSizes.medium,
                left: AppSizes.medium,
                right: AppSizes.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall,
                  ),
                  gapHMedium,
                  Text(
                    article.publishedAt.formatToDateTime,
                    style: textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: showBookmark
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          launchWebsite(article.url);
                        },
                        child: const Text('Visit Web'),
                      ),
                      if (showBookmark)
                        TextButton(
                          onPressed: () {
                            context
                                .read<BookmarkListBloc>()
                                .add(BookmarkToggleRequested(article));
                          },
                          child:
                              BlocBuilder<BookmarkListBloc, BookmarkListState>(
                            builder: (context, state) {
                              if (state.articles.contains(article)) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Bookmarked'),
                                    gapWMedium,
                                    Icon(CupertinoIcons.check_mark),
                                  ],
                                );
                              } else {
                                return const Text('Bookmark');
                              }
                            },
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
