import SwiftUI

public class WhatsNew: ObservableObject {
    
    @AppStorage("savedVersion") var savedVersion: String = "1.000.000"
    
    public var fontColor = Color.primary
    public var pageColor = Color.white
    public var alwaysShow = false

    public init() { }
    
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let version = getCurrentAppVersion()
        if savedVersion < version {
            print("App is up to date!")
            if alwaysShow {
                showWhatsNew.wrappedValue = true
            }
        } else {
            // Toogle to show WhatsNew Screen as full screen
            savedVersion = version
            showWhatsNew.wrappedValue = true
        }
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
}


