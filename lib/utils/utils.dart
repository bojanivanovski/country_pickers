import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/widgets.dart';

class CountryPickerUtils {
  static Country getCountryByIsoCode(String isoCode) {
    try {
      return countryList.firstWhere(
        (country) => country.isoCode.toLowerCase() == isoCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception("The initialValue provided is not a supported iso code!");
    }
  }

  static Country getCountryByName(String name) {
    try {
      return countryList.firstWhere(
        (country) => country.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (error) {
      return getCountryByPhoneCode("+389");
      // throw Exception("The initialValue provided is not a supported iso code!");
    }
  }

  static String getFlagImageAssetPathFromCountryname(String countryName) {
    return getFlagImageAssetPath(countryList
        .firstWhere(
          (country) => country.name.toLowerCase() == countryName.toLowerCase(),
        )
        .isoCode);
  }

  static String getFlagImageAssetPath(String isoCode) {
    return "assets/${isoCode.toLowerCase()}.png";
  }

  static Widget getFlagImageWidgetFromCountryName(String country) {
    return Image.asset(
      CountryPickerUtils.getFlagImageAssetPathFromCountryname(country),
      height: 20.0,
      width: 30.0,
      fit: BoxFit.fill,
      package: "country_pickers",
    );
  }

  static Widget getDefaultFlagImage(Country country) {
    return Image.asset(
      CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
      height: 20.0,
      width: 30.0,
      fit: BoxFit.fill,
      package: "country_pickers",
    );
  }

  static Country getCountryByPhoneCode(String phoneCode) {
    try {
      return countryList.firstWhere(
        (country) => country.phoneCode.toLowerCase() == phoneCode.toLowerCase(),
      );
    } catch (error) {
      throw Exception(
          "The initialValue provided is not a supported phone code!");
    }
  }

  static String getIso3CodeByCountry(String countryName) {
    try {
      return countryList
          .firstWhere(
            (country) =>
                country.name.toLowerCase() == countryName.toLowerCase(),
          )
          .iso3Code;
    } catch (error) {
      return "MK";
    }
  }

  static String getIlpcCodeByCountry(String countryName) {
    try {
      return countryList
          .firstWhere(
            (country) =>
                country.name.toLowerCase() == countryName.toLowerCase(),
          )
          .ilpcCode;
    } catch (error) {
      return "MK";
    }
  }
}
