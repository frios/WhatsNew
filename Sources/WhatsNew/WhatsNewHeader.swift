//
//  FullScreenHeader.swift
//  
//
//  Created by Ferdinand Rios on 11/25/20.
//

import SwiftUI

public struct WhatsNewHeader<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode
    
    var appName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    let content: Content

    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
                .foregroundColor(.blue)
                .padding(.trailing)
            }
            .padding(.top, 10)
            
            Text("What's new in \(appName)?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding(.bottom, 20)

            content
                .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.horizontal, 10)
    }
    
}


