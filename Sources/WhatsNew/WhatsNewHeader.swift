//
//  FullScreenHeader.swift
//  
//
//  Created by Ferdinand Rios on 11/25/20.
//

import SwiftUI

public struct WhatsNewHeader<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode
    
    var appName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String ?? "New App"
    
    let content: Content

    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }

    public var body: some View {
        VStack {
            ScrollView {
                VStack (alignment: .center) {
                    Text("What's New")
                        .fontWeight(.bold)
                    Text("in \(appName)")
                        .fontWeight(.bold)
                }
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)

                content
            }
            
            Spacer()
            
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


