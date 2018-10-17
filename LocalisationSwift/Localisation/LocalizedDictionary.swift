//
//  LocalizedDictionary.swift
//  LocalisationSwift
//
//  Created by IBM-MOBILITY on 17/10/18.
//  Copyright © 2018 DurgaPrasad. All rights reserved.
//

import Foundation

let CurrentLanguageKey = "CurrentLanguageKey"
let StandardLanguageLocale = "en"

let currentLocalizedDictionary = LocalizedDictionary()

class LocalizedDictionary {
    
    init() {
        self.allStrings = self.getLocalizedStrings(for: self.languageLocale)
    }
    
    var languageLocale: String {
        get {
            if let userLocale = UserDefaults.standard.value(forKey: CurrentLanguageKey) as? String {
                return userLocale
            } else {
                let locale = Locale.preferredLanguages[0]
                print(locale)
                let index = locale.index(of: "-") ?? locale.endIndex
                let languageWithoutRegion = locale[..<index]
                for languages in availableLanguages {
                    if languages.code == languageWithoutRegion {
                        return String(languageWithoutRegion)
                    }
                }
            }
            return StandardLanguageLocale
        }
        set {
            self.allStrings = nil
            self.allStrings = self.getLocalizedStrings(for: newValue)
            UserDefaults.standard.set(newValue, forKey: CurrentLanguageKey)
        }
    }
    
    var allStrings: [String: Any]?
    
    var localDictionaryWithTranslations = [String: Any]()
    
    
    let availableLanguages:[(code:String, language:String, englishName: String)] = [(code: "en", language: "English", englishName: "English"),
                                                                                                                     (code: "es", language: "Español", englishName: "Spanish"),
                                                                                                                     ]
    private func getLocalizedStrings(for locale: String) -> [String: Any]? {
        let fileName = "Strings_\(locale)"
        if let writePath = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = NSData(contentsOfFile: writePath) {
            do {
                let dict = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
                if let stringsDict = dict as? [String: Any], let listOfConfigs = stringsDict["configs"] as? [[String : Any]] {
                    for configs in listOfConfigs {
                        let key = configs["key"] as? String
                        let value = configs["value"]
                        if let key = key {
                            localDictionaryWithTranslations[key] = value
                        }
                    }
                    print("Translations:\n\(localDictionaryWithTranslations) \n Translations")
                    return localDictionaryWithTranslations
                } else if let stringsDict = dict as? [String: Any] {
                    return stringsDict
                }
                return nil
            } catch let error {
                print(error)
                assertionFailure("error while reading the translations for this language")
            }
        }
        return nil
    }
    
    func string(for key: String, comment: String) -> String {
        guard let value = allStrings?[key] as? String else {
            assertionFailure("could not find value for \(key) in Strings_\(languageLocale) file")
            return ""
        }
        return value
    }
    
    func update(with allTranslations: [[String: Any]]) {
        guard var allStrings = allStrings else {
            return
        }
        for dictionary in allTranslations {
            for allStringsKeys in allStrings.keys {
                if let key = dictionary["key"] as? String, key == allStringsKeys {
                    allStrings[allStringsKeys] = dictionary["value"]
                    break
                }
            }
        }
        self.allStrings = allStrings
        updateOnDisk()
    }
    func updateOnDisk() {
        let fileName = "Strings_\(languageLocale)"
        if let writePath = Bundle.main.path(forResource: fileName, ofType: "json"), let allStrings = allStrings {
            let url = URL(fileURLWithPath: writePath)
            do {
                let data = try JSONSerialization.data(withJSONObject: allStrings, options: .prettyPrinted)
                try data.write(to: url, options: .atomic)
            } catch let error {
                print(error)
            }
        }
    }
}
