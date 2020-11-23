//
//  WhatsNew1.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI
import WhatsNew

public struct WhatsNewPage<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode
    
    let content: Content
    let pageNum : Int
    let properties: WhatsNew
    let totalPages: Int
     
    var appName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    init(content: Content, pageNum: Int, totalPages: Int, properties: WhatsNew){
        self.content = content
        self.pageNum = pageNum
        self.totalPages = totalPages
        self.properties = properties
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
            
            Text(totalPages > 1 ? "What's new in \(appName)? \n(page \(pageNum))": "What's new in \(appName)?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            content
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .foregroundColor(properties.fontColor)
    }
}


