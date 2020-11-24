import SwiftUI

public class WhatsNew: ObservableObject {
    
    @AppStorage("savedVersion") var savedVersion: String = "1.000.000"
    
    public var fontColor = Color.primary
    public var pageColor = Color.white
    public var alwaysShow = false

    public init() { }
    
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let currentVersion = getCurrentAppVersion()
        print("Current Version: \(currentVersion)\nSaved Version: \(savedVersion)")
        if savedVersion < currentVersion {
            //save the current version to saved version
            savedVersion = currentVersion
            // Toogle to show WhatsNew Screen as full screen
            showWhatsNew.wrappedValue = true
        } else {
            print("App is up to date!")
            if alwaysShow {
                showWhatsNew.wrappedValue = true
            }
        }
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String).\(Bundle.main.infoDictionary?["CFBundleVersion"] as! String)"
    }
}


