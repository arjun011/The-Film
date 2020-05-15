//
//  LoadingSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct LoadingSwiftUIView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "film")
                .font(.system(size: 30))
                .foregroundColor(.blue)
            Text("Loading....")
                .font(.system(size: 20))
                .foregroundColor(.white)
            Spacer()
        }
    }
}


struct LoadingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSwiftUIView()
    }
}
