//
//  TVDetailsRecommendationShowSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct TVDetailsRecommendationShowSwiftUIView: View {
    var tvShow:TVShowDataModel?
    var body: some View {
        
        WebImage(url: URL(string: self.getMovieImageUrl(tvShow)))
            .resizable()
            .renderingMode(.original)
            .placeholder(content: {
                Image(systemName: "star")
                    .foregroundColor(.white.opacity(0.4))
                    .font(.system(size: 35))
            })
            .frame(width: 140, height:200)
            .scaledToFit()
            .clipped()
            .cornerRadius(5)
        
    }
    var getMovieImageUrl:(TVShowDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct TVDetailsRecommendationShowSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVDetailsRecommendationShowSwiftUIView()
    }
}
