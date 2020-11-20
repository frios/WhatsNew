import SwiftUI

public struct WhatsNew {
    
    var appName: String
    var savedVersion: String
    var showWhatsNew: Bool
    
    public init(appName: String, savedVersion: String, showWhatsNew: Bool) {
        self.appName = appName
        self.savedVersion = savedVersion
        self.showWhatsNew = showWhatsNew
    }
    
    public func checkForUpdate() {
        let version = getCurrentAppVersion()
        if savedVersion == version {
            print("App is up to date!")
        } else {
            // Toogle to show WhatsNew Screen as full screen
//            savedVersion = version
//            showWhatsNew.toggle()
        }
    }
    
    // Get current Version of the App
    public func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
}
