class AppImages {
  AppImages._();

  // Image assets path...

  static String buildCompanyImageUrl(String companyWebsiteUrl) =>
      'https://logo.clearbit.com/$companyWebsiteUrl?size=$_defaultCompanyImageSize';

  static const int _defaultCompanyImageSize = 100;
}
