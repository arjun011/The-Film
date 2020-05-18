//
//  TVShowDetailsOverViewSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct TVShowDetailsOverViewSwiftUIView: View {
    var tvShowDetails:TVShowDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("OverView")
                .font(.headline)
            Text(self.tvShowDetails?.overview ?? "")
        })
    }
}

struct TVShowDetailsOverViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsOverViewSwiftUIView()
    }
}
