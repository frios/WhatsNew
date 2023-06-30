//
//  WhatsNew.swift
//
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//

import SwiftUI

public class WhatsNew: ObservableObject {
    
    @AppStorage("savedVersion") var savedVersion: String = "1.000.000"
    
    var alwaysShow = false

    public init(alwaysShow: Bool = false) {
        self.alwaysShow = alwaysShow
    }
    
    //check the currentVersion against the saved version
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let currentVersion = getCurrentAppVersion()
        #if DEBUG
        print("Current Version: \(currentVersion)\nSaved Version: \(savedVersion)")
        #endif
        if alwaysShow {
            showWhatsNew.wrappedValue = alwaysShow
            return
        }
        
        if savedVersion < currentVersion {
            savedVersion = currentVersion
            showWhatsNew.wrappedValue = true
        } else if savedVersion > currentVersion {
            #if DEBUG
            print("App is behind!")
            #endif
            savedVersion = currentVersion
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
}


