//
//  PageView.swift
//  WhatsNewDemo
//
//  Created by Stéphane Peter on 6/29/23.
//

import SwiftUI
import WhatsNew

struct PageView: View {
    let page: Int
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10){
                Text("This is page \(page)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                BulletPointView(title: "We now have SEARCH!!!",
                                systemName: "paintbrush.fill") {
                    Text("Search to find books that have been on previous best seller lists.")
                }
                BulletPointView(title: "We now have OTHER STUFF!!!",
                                systemName: "ant") {
                    Text("Search to find books that have been on previous best seller lists.")
                    Toggle("Toggle", isOn: .constant(true))
                }
                BulletPointView(title: "More bugs squashed.",
                                imageName: "Truck") {
                    Text("And the hits keep coming")
                }
                
                Spacer()
            }
            .padding()
            .accentColor(Color.red)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: 1)
    }
}
