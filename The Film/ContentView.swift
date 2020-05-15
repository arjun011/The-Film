//
//  ContentView.swift
//  The Film
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var moveHomePage = false
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            if self.moveHomePage {
                TabbarSwiftUI()
            }else {
                VStack {
                    Text("The Film")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image(systemName: "film")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }.onTapGesture {
                    self.moveHomePage.toggle()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
