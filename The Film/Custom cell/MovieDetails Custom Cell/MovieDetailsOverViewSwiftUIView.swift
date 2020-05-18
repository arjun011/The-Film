//
//  MovieDetailsOverViewSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct MovieDetailsOverViewSwiftUIView: View {
    var movieDetails:MovieDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("OverView")
                .font(.headline)
            Text(self.movieDetails?.overview ?? "")
            HStack {
                Text("Budget")
                    .font(.headline)
                Text(String(format: "$%.2f",(self.movieDetails?.budget ?? 0)))
            }
            HStack {
                Text("Revenue")
                    .font(.headline)
                Text(String(format: "$%.2f",(self.movieDetails?.revenue ?? 0)))
            }
        })
    }
}

struct MovieDetailsOverViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsOverViewSwiftUIView()
    }
}
