//
//  WhatsNewView.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNewView: View {
    
    public var appName: String
    
    public init(appName: String){
        self.appName = appName
    }
    
    public var body: some View {
        TabView {
            WhatsNew1(appName: appName)
            WhatsNew2()
        }
        .background(Color.white)
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }}

struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewView(appName: "Test")
    }
}


