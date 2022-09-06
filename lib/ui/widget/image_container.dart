import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_loader.dart';

class ImageContainer extends StatefulWidget {
  final String url;
  final BoxFit? boxFit;
  final bool showLoader;
  final double? circular;

  const ImageContainer(
      {Key? key,
      required this.url,
      this.boxFit = BoxFit.cover,
      this.showLoader = false,
      this.circular})
      : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.circular ?? 10.0),
          image: DecorationImage(
            image: imageProvider,
            fit: widget.boxFit,
          ),
        ),
      ),
      imageUrl: widget.url,
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.circular ?? 10.0),
            color: Colors.grey.shade100),
      ),
      progressIndicatorBuilder: (context, url, progress) => widget.showLoader
          ? const AppLoader()
          : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.circular ?? 10.0),
                  color: Colors.grey.shade500),
            ),
    );
  }
}
