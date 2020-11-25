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
        print("Current Version: \(currentVersion)\nSaved Version: \(savedVersion)")
        if savedVersion < currentVersion {
            savedVersion = currentVersion
            showWhatsNew.wrappedValue = true
        } else if savedVersion > currentVersion {
            print("App is behind!")
            savedVersion = currentVersion
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


