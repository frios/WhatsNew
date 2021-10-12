//
//  WhatsNewView.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNewView<Content: View>: View {
    
    let content: Content
    
    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }
        
    public var body: some View {
        TabView {
            WhatsNewHeader {
                content
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}




