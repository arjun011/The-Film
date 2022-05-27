
//
//  TVShowDetailsSeasonSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct TVShowDetailsSeasonSwiftUIView: View {
    var tvShowDetails:TVShowDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, content: {
            
            Text("Seasons")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(alignment: .center, spacing: 15, content: {
                    
                    ForEach(self.tvShowDetails?.seasons ?? [seasonsDataModel](), id: \.id) { season in
                        
                        VStack(alignment: .leading, content: {
                            
                            WebImage(url: URL(string: self.getProfileImageUrl(season.poster_path)))
                                .resizable()
                                .renderingMode(.original)
                                .placeholder(content: {
                                    Image(systemName: "star")
                                        .foregroundColor(.white.opacity(0.4))
                                        .font(.system(size: 35))
                                })
                                .frame(width: 130, height:170)
                                .scaledToFit()
                                .clipped()
                                .cornerRadius(5)
                            
                            Text("\(season.name ?? "")")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            VStack {
                                Text("\(season.episode_count ?? 0) Episodes")
                            }
                            .font(.caption)
                        })
                    }
                })
            }
        })
    }
    var getProfileImageUrl:(String?) -> String = {
        return imageBaseUrl + "h632" + ($0 ?? "")
    }
}

struct TVShowDetailsSeasonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsSeasonSwiftUIView()
    }
}
