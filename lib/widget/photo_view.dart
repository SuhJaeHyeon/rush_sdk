import 'package:cached_network_image/cached_network_image.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/widget/text/app_default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:rush_sdk/widget/scaffold.dart';

class PhotoViewItem {
  final String image;
  final String type;

  PhotoViewItem({required this.image, String? type}) : type = type ?? "image";
}

class PhotoViewPage extends StatefulWidget {
  final int index;
  final Iterable<PhotoViewItem> items;
  final PageController pageController;
  const PhotoViewPage({
    super.key,
    required this.items,
    required this.index,
    required this.pageController,
  });

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  late int _currentIndex;

  bool loading = true;

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPermission(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered,
                imageProvider: CachedNetworkImageProvider(
                  widget.items.elementAt(index).image,
                ),
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            pageController: widget.pageController,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            top: 17,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                child: Text(
                  '${_currentIndex + 1} / ${widget.items.length}',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.text16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                // Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.transparent,
                child: SafeArea(
                  child: SvgPicture.asset(
                    'assets/icon/close_line.svg',
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
