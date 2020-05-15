//
//  TVShowDetailsSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct TVShowDetailsSwiftUIView: View {
    @ObservedObject var model = TVShowDetailsModel()
    var body: some View {
        VStack {
            Text("Hello")
        }
    }
}

struct TVShowDetailsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsSwiftUIView()
    }
}
