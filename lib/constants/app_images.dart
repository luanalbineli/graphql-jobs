class AppImages {
  AppImages._();

  static const icEmptyFileGray = 'assets/images/ic_empty_file_gray.svg';

  static String buildCompanyImageUrl(String companyWebsiteUrl) =>
      'https://logo.clearbit.com/$companyWebsiteUrl?size=$_defaultCompanyImageSize';

  static const int _defaultCompanyImageSize = 100;
}
