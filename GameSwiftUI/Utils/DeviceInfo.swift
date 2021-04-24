//
//  DeviceInfo.swift
//  GameSwiftUI
//
//  Created by Joshi on 18.04.21.
//

import Foundation

func getAppVersion() -> String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as! String
    let build = dictionary["CFBundleVersion"] as! String
    return version + "(" + build + ")"
}

func getOSVersion() -> String {
    let os = ProcessInfo().operatingSystemVersion
    return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
}

func getOSLanguage() -> String {
    return Locale.current.identifier
}

extension Bundle {
    var displayName: String? {
            return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
                object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}

func getAppName() -> String {
    return Bundle.main.displayName!
}
