//
//  LocalizableString.swift
//  LocalisationSwift
//
//  Created by DurgaPrasad on 17/10/18.
//  Copyright © 2018 DurgaPrasad. All rights reserved.
//

import Foundation


struct Localizable {
    static func string(_ key: String?, comment: String) -> String {
        guard let key = key else {
            return ""
        }
        return currentLocalizedDictionary.string(for: key, comment: comment)
    }
}
