import SwiftUI

public struct WhatsNew {
    
    @AppStorage("savedVersion") var savedVersion: String = "1.000.000"
    
    let fontColor: Color
    let pageColor: Color
    let alwaysShow: Bool

    public init(pageColor: Color = .white, fontColor: Color = .primary, alwaysShow: Bool = false) {
        self.pageColor = pageColor
        self.fontColor = fontColor
        self.alwaysShow = alwaysShow
    }
    
    public func checkForUpdate( showWhatsNew: Binding<Bool> ) {
        let version = getCurrentAppVersion()
        if savedVersion == version {
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


