//
//  UIKit+Localization.swift
//  LocalisationSwift
//
//  Created by DurgaPrasad on 17/10/18.
//  Copyright © 2018 DurgaPrasad. All rights reserved.


import UIKit

extension NSObject {
    
    /// - Returns: `.Some(nil)` if `key` is `nil`, `.None` if there is no value found, or `.Some(String)` when localised text found.
    func localisedIBStringForKey(_ key: String?, inBundle bundle: Bundle = Bundle.main) -> Optional<String>? {
        guard let key = key else {
            return .some(nil)
        }
        #if TARGET_INTERFACE_BUILDER
        // Ignore and use current interface build text
        return .none
        #else
        let localizedString = bundle.localizedString(forKey: key, value: "###DEFAULT###", table: nil)
        if localizedString == "###DEFAULT###" {
            // Value not found
            #if DEBUG
            if let view = self as? UIView {
                view.backgroundColor = UIColor.red
            }
            // Not found - use current interface build text
            return .none
            #else
            preconditionFailure("Missing localized InterfaceBuild string for key '\(key)'")
            #endif
        } else {
            return localizedString
        }
        #endif
    }
}

// MARK: - Views

extension UILabel {
    @IBInspectable var localizedTextKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //                localisedIBStringForKey(newValue) {
                self.text = text
            }
        }
    }
}

extension UITextField {
    @IBInspectable var localizedTextKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                self.text = text
            }
        }
    }
    @IBInspectable var localizedPlaceholderKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                placeholder = text
            }
        }
    }
}

extension UIButton {
    @IBInspectable var localizedNormalTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                UIView.performWithoutAnimation {
                    setTitle(text, for: .normal)
                    layoutIfNeeded()
                }
            }
        }
    }
    @IBInspectable var localizedSelectedTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                UIView.performWithoutAnimation {
                    setTitle(text, for: .selected)
                    setTitle(text, for: [.selected, .highlighted])
                    layoutIfNeeded()
                }
            }
        }
    }
    @IBInspectable var localizedSelectedDisabledTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                UIView.performWithoutAnimation {
                    setTitle(text, for: [.selected, .disabled])
                    layoutIfNeeded()
                }
            }
        }
    }
    @IBInspectable var localizedDisabledTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                UIView.performWithoutAnimation {
                    setTitle(text, for: .disabled)
                    layoutIfNeeded()
                }
            }
        }
    }
}

/// MARK: - View objects

extension UIViewController {
    @IBInspectable var localizedTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                title = text
            }
        }
    }
}

extension UINavigationItem {
    @IBInspectable var localizedTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                title = text
            }
        }
    }
}

extension UIBarItem {
    @IBInspectable var localizedTitleKey: String? {
        get {
            fatalError("This accessor method should not called")
        }
        set {
            let text = Localizable.string(newValue, comment: "")
            if text != "" {
                //            if let text = localisedIBStringForKey(newValue) {
                title = text
            }
        }
    }
}
