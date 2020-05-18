//
//  MovieDetailRecomdMovieListSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct MovieDetailRecommendationsMovieListSwiftUIView: View {
    var movie:MovieDataModel?
    var body: some View {
                       
                        WebImage(url: URL(string: self.getMovieImageUrl(movie)))
                            .resizable()
                            .renderingMode(.original)
                            .placeholder(Image(systemName: "photo"))
                            .indicator(.activity)
                            .frame(width: 140, height:200)
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(5)
         
    }
    var getMovieImageUrl:(MovieDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct MovieDetailRecommendationsMovieListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailRecommendationsMovieListSwiftUIView()
    }
}
