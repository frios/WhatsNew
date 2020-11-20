//
//  WhatsNew1.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI


public struct WhatsNew1: View {
    @Environment(\.presentationMode) var presentationMode
    
    var appName: String

    init(appName: String){
        self.appName = appName
    }


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

struct WhatsNew1_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNew1(appName: "Test")
    }
}
