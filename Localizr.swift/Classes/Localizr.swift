import Foundation

enum LocalizrKey:String {
  
  case appleLocale    = "AppleLocale"
  case currentLocale  = "Localizr_current_locale"
}

public class Localizr {
  
  /**
   Retrieve the current system locale.
  */
  public static func systemLocale() -> String? {
    return UserDefaults.standard.string(forKey: LocalizrKey.appleLocale.rawValue)
  }
  
  /**
   List of supported locales
 
   - Parameters:
      - excludeBase: default value is true
  */
  public static func supportedLocales(_ excludeBase:Bool = true) -> [String] {
    var _localizations = Bundle.main.localizations
    if let indexOfBase = _localizations.index(of: "Base"), excludeBase == true {
      _localizations.remove(at: indexOfBase)
    }
    return _localizations
  }
  
  /**
   Update the current locale
  */
  public static func update(locale:String) {
    if Localizr.supportedLocales().contains(locale) {
      UserDefaults.standard.set(locale, forKey: LocalizrKey.currentLocale.rawValue)
    }
  }
  
  /**
   To get current Locale.
  */
  public static func currentLocale() -> String? {
    return UserDefaults.standard.string(forKey: LocalizrKey.currentLocale.rawValue) ?? Localizr.systemLocale()
  }
}

extension String {
  
  /**
   An extension method of a string to retrieve the localized value/text.
   
   - Parameters:
      - repeated: (Optional) This is the number of count where the text will going to repeat. It's good for debugging the size of of UILabels assuming that in other languages, some phrases will be 2 or 3 times larger than in english.
 
  */
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
