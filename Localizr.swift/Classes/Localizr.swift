import Foundation

enum LocalizrKey:String {
  
  /// Apple's Locale key
  case appleLocale    = "AppleLocale"
  /// Localizr Current Locale key
  case currentLocale  = "Localizr_current_locale"
}

public class Localizr {
  
  /// Retrieve the current system Locale
  ///
  /// - Returns: String?
  public static func systemLocale() -> String? {
    return UserDefaults.standard.string(forKey: LocalizrKey.appleLocale.rawValue)
  }
  
  /// List of supported locales
  ///
  /// - Parameter excludeBase: (default value: true)
  /// - Returns: [String]
  public static func supportedLocales(_ excludeBase:Bool = true) -> [String] {
    var _localizations = Bundle.main.localizations
    if let indexOfBase = _localizations.index(of: "Base"), excludeBase == true {
      _localizations.remove(at: indexOfBase)
    }
    return _localizations
  }
  
  /// Set the current locale
  ///
  /// - Parameter locale: String
  public static func update(locale:String) {
    if Localizr.supportedLocales().contains(locale) {
      UserDefaults.standard.set(locale, forKey: LocalizrKey.currentLocale.rawValue)
    }
  }
  
  /// Get the current locale
  ///
  /// - Returns: String?
  public static func currentLocale() -> String? {
    return UserDefaults.standard.string(forKey: LocalizrKey.currentLocale.rawValue) ?? Localizr.systemLocale()
  }
}

extension String {
  
  /// An extension method of a string to retrieve the localized value/text.
  ///
  /// - Parameter repeated: (Optional) This is the number of count where the localized text will going to repeat.
  /// - Returns: String?
  public func localized(repeated:Int = 1) -> String? {
    
    let localeCode = UserDefaults.standard.string(forKey: LocalizrKey.currentLocale.rawValue)
    var s = ""
    if let path = Bundle.main.path(forResource: localeCode, ofType: "lproj") {
      if let bundle = Bundle(path: path) {
        s =  NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
      }
    } else {
      s = NSLocalizedString(self, comment: "")
    }
    
    if repeated > 1 {
      return String(repeating: s, count: repeated)
    }
    return s
  }
}
