//
//  MovieDetailsHeaderSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 14/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct MovieDetailsHeaderSwiftUIView: View {
    var movieTime:String?
    var movieDetails:MovieDetailsDataModel?
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.leading, spacing: 5, content: {
            HStack {
                Text(self.movieDetails?.release_date ?? "")
                Text(self.movieTime ?? "")
            }.font(.callout)
            Text(self.movieDetails?.tagline ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.movieDetails?.genres ?? [genresDataModel]() , id: \.id) { genres in
                        Text("\(genres.name ?? ""), ")
                    }.font(.callout)
                }
            }
            
        }).foregroundColor(.white)
            .padding()
        
    }
}

struct MovieDetailsHeaderSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsHeaderSwiftUIView()
    }
}
