import SwiftUI

public struct WhatsNew {
    
    @AppStorage("savedVersion") var savedVersion: String = "1.000.000"

    public init(){}
    
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let version = getCurrentAppVersion()
        if savedVersion == version {
            print("App is up to date!")
        } else {
            // Toogle to show WhatsNew Screen as full screen
            savedVersion = version
            showWhatsNew.wrappedValue = true
        }
    }
    
    // Get current Version of the App
    public func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
}
