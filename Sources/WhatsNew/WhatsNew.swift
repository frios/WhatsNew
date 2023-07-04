//
//  WhatsNew.swift
//
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//

import SwiftUI

public class WhatsNew: ObservableObject {
    
    @AppStorage("savedVersion") var savedVersion: String?
    
    var alwaysShow = false
    
    public init(alwaysShow: Bool = false) {
        self.alwaysShow = alwaysShow
    }
    
    //check the currentVersion against the saved version
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let currentVersion = getCurrentAppVersion()
#if DEBUG
        print("Current Version: \(currentVersion)\nSaved Version: \(savedVersion ?? "None")")
#endif
        if alwaysShow {
            showWhatsNew.wrappedValue = alwaysShow
            return
        }
        
        // If this is the first launch (no saved version), save the current version and return
        guard let savedVersion = savedVersion else {
            self.savedVersion = currentVersion
            return
        }
        
        if isVersion(savedVersion, lessThan: currentVersion) {
            self.savedVersion = currentVersion
            showWhatsNew.wrappedValue = true
        } else if isVersion(savedVersion, greaterThan: currentVersion) {
#if DEBUG
            print("App is behind!")
#endif
            self.savedVersion = currentVersion
        } else {
#if DEBUG
            print("App is up to date!")
#endif
        }
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
    
    // Compare version strings as version numbers
    private func isVersion(_ version1: String, lessThan version2: String) -> Bool {
        let v1Components = version1.split(separator: ".").compactMap { Int($0) }
        let v2Components = version2.split(separator: ".").compactMap { Int($0) }
        
        for (v1, v2) in zip(v1Components, v2Components) {
            if v1 < v2 {
                return true
            } else if v1 > v2 {
                return false
            }
        }
        
        return v1Components.count < v2Components.count
    }
    
    private func isVersion(_ version1: String, greaterThan version2: String) -> Bool {
        return !isVersion(version1, lessThan: version2) && version1 != version2
    }
    
}


