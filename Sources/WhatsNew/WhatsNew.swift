import SwiftUI

public struct WhatsNew {
    
    var appName: String?
    @Binding var savedVersion: String
    @Binding var showWhatsNew: Bool
    
    public func checkForUpdate() {
        let version = getCurrentAppVersion()
        if savedVersion == version {
            print("App is up to date!")
        } else {
            // Toogle to show WhatsNew Screen as full screen
            savedVersion = version
            showWhatsNew.toggle()
        }
    }
    
    // Get current Version of the App
    public func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
}
