//
//  WhatsNew2.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNew2: View {
    @Environment(\.presentationMode) var presentationMode

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
            Text("Whats new 2")
            Spacer()
        }
    }
}

struct WhatsNew2_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNew2()
    }
}
