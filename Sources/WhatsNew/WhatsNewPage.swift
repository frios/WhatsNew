//
//  WhatsNew1.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI


public struct WhatsNewPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    var appName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String

    public var body: some View {
        VStack {
            HStack (alignment: .top){
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
                .padding(.trailing)
            }
            Text("What's new in \(appName)?")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            Spacer()
        }
    }
}

struct WhatsNewPage_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewPage()
    }
}
