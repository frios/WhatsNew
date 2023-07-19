//
//  WhatsNewView.swift
// 
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//

import SwiftUI

public struct WhatsNewView<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode

    let appName: String = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String ?? "My App"
    let multiPage: Bool
    let showVersion: Bool
    let content: Content
    
    private let bundle = Bundle.module
    
    public init(multiPage: Bool = true, showVersion: Bool = true, @ViewBuilder contentProvider: () -> Content) {
        self.multiPage = multiPage
        self.showVersion = showVersion
        self.content = contentProvider()
    }
        
    public var body: some View {
        VStack {
            VStack (alignment: .center) {
                Text(String(format:NSLocalizedString("What's New\nin %@", bundle: bundle, comment: "Dialog Title"), appName))
                    .fontWeight(.bold)
                if showVersion, let version = Bundle.main.infoDictionary?["CFBundleLongVersionString"] as? String {
                    Text("v\(version)")
                        .font(.footnote)
                        .padding(.top)
                }
            }
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(.top, 50)
            
            if multiPage {
                TabView {
                    content
                }
#if !os(macOS)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
#endif
            } else {
                content
                    .padding()
            }
            
            Button(NSLocalizedString("Continue", bundle: bundle, comment: "Button")) {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(12)
            .padding(.bottom, 30)
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 10)
    }
}

#if DEBUG
struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewView(multiPage: false) {
            VStack (alignment: .leading) {
                BulletPointView(title: "New feature",
                                systemName: "circle.fill",
                                text: "This is a new feature for this app. And this text should wrap.")
                BulletPointView(title: "New feature",
                                systemName: "square.fill",
                                text: "This is a new feature for this app. And this text should wrap.")
                BulletPointView(title: "New feature",
                                systemName: "triangle.fill",
                                text: "This is a new feature for this app. And this text should wrap.")
            }
        }
    }
}
#endif


