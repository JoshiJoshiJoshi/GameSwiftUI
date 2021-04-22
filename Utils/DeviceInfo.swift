//
//  DeviceInfo.swift
//  GameSwiftUI
//
//  Created by Joshi on 18.04.21.
//

import Foundation
// Copy-paste https://stackoverflow.com/questions/51354965/get-the-ios-version-of-a-device-programmatically/51355008
func getAppVersion()->String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as! String
    let build = dictionary["CFBundleVersion"] as! String
    return version + "(" + build + ")"
}

func getOSVersion()->String {
    let os = ProcessInfo().operatingSystemVersion
    return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
}


func getOSLanguage() -> String {
    return Locale.current.identifier
}

// Copy-Paste https://stackoverflow.com/questions/28254377/get-app-name-in-swift
extension Bundle {
    var displayName: String? {
            return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
                object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}

func getAppName() -> String {
    return Bundle.main.displayName!
}
