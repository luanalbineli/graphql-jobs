import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graphql_jobs/constants/app_colors.dart';
import 'package:graphql_jobs/constants/app_dimens.dart';
import 'package:graphql_jobs/constants/app_images.dart';
import 'package:graphql_jobs/modules/job/domain/entities/company.dart';

class CompanyImage extends StatelessWidget {
  final Company _company;
  final double size;

  const CompanyImage(this._company, {required this.size});

  @override
  Widget build(BuildContext context) {
    final companyImageUrl = AppImages.buildCompanyImageUrl(_company.websiteUrl);

    final companyImagePlaceholder = _buildCompanyImagePlaceholder(context);

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: companyImageUrl,
      width: size,
      height: size,
      placeholder: (_, __) => companyImagePlaceholder,
      errorWidget: (_, __, error) => companyImagePlaceholder,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.companyImageBorderRadius),
          ),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildCompanyImagePlaceholder(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.wildSand,
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.companyImageBorderRadius),
          ),
        ),
        child: Center(
          child: Text(
            _company.name.characters.first.toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      );
}
