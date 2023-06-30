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

    let appName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String ?? "New App"
    let content: Content
    
    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }
        
    public var body: some View {
        VStack {
            VStack (alignment: .center) {
                Text("What's New")
                    .fontWeight(.bold)
                Text("in \(appName)")
                    .fontWeight(.bold)
            }
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(.top, 50)
            
            TabView {
                content
            }
            #if !os(macOS)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            #endif
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue")
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color("AccentColor"))
                                    .frame(width: 300, height: 40))
            })
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 10)
    }
}



