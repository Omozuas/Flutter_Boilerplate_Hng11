/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// Directory path: assets/images/png/product_listing
  $AssetsImagesPngProductListingGen get productListing =>
      const $AssetsImagesPngProductListingGen();
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// Directory path: assets/images/svg/product_listing
  $AssetsImagesSvgProductListingGen get productListing =>
      const $AssetsImagesSvgProductListingGen();
}

class $AssetsImagesPngProductListingGen {
  const $AssetsImagesPngProductListingGen();

  /// File path: assets/images/png/product_listing/iphone.png
  AssetGenImage get iphone =>
      const AssetGenImage('assets/images/png/product_listing/iphone.png');

  /// File path: assets/images/png/product_listing/product.png
  AssetGenImage get product =>
      const AssetGenImage('assets/images/png/product_listing/product.png');

  /// List of all assets
  List<AssetGenImage> get values => [iphone, product];
}

class $AssetsImagesSvgProductListingGen {
  const $AssetsImagesSvgProductListingGen();

  /// File path: assets/images/svg/product_listing/active.svg
  SvgGenImage get active =>
      const SvgGenImage('assets/images/svg/product_listing/active.svg');

  /// File path: assets/images/svg/product_listing/grid_icon.svg
  SvgGenImage get gridIcon =>
      const SvgGenImage('assets/images/svg/product_listing/grid_icon.svg');

  /// File path: assets/images/svg/product_listing/list_icon.svg
  SvgGenImage get listIcon =>
      const SvgGenImage('assets/images/svg/product_listing/list_icon.svg');

  /// File path: assets/images/svg/product_listing/search_icon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/images/svg/product_listing/search_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [active, gridIcon, listIcon, searchIcon];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
