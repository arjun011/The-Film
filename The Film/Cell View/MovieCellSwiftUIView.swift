//
//  MovieCellSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI
struct MovieCellSwiftUIView: View {
    var movieObject:MovieDataModel?
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            ZStack {
                WebImage(url: URL(string: self.getImageUrl(movieObject)))
                    .resizable()
                    .renderingMode(.original)
                    .placeholder(content: {
                        Image(systemName: "star")
                            .foregroundColor(.white.opacity(0.4))
                            .font(.system(size: 35))
                    })
                    .indicator(.activity)
                    //.animation(.easeInOut(duration: 0.5))
                    //.transition(.fade)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(5)
                    .padding(.bottom,10)
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        
                        // Draw Rating circel 
                        VoteAverageCircleSwiftUIView(voteAverage: movieObject?.vote_average ,circleFrame: (width: 35, height: 35)).padding(.trailing, 5)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(movieObject?.title ?? "N/A")
                    .fontWeight(.semibold)
                Text(movieObject?.release_date ?? "N/A")
                    .foregroundColor(.gray)
            }
            .font(.callout)
            .lineLimit(1)
            .padding([.horizontal,.vertical], 5)
        }.foregroundColor(.white)
    }
    
    var getImageUrl:(MovieDataModel?) -> String = {
        print(imageBaseUrl + "w342" + ($0?.poster_path ?? ""))
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
    
}

struct MovieCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellSwiftUIView()
    }
}
