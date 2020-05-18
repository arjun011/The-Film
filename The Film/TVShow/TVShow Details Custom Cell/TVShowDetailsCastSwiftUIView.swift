//
//  TVShowDetailsCastSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct TVShowDetailsCastSwiftUIView: View {
    var tvShowDetails:TVShowDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, content: {
            
            Text("Cast")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .center, spacing: 15, content: {
                    ForEach(self.tvShowDetails?.credits?.cast ?? [castDataModel](), id: \.id) { item in
                        
                        VStack(alignment: .leading, content: {
                            
                            WebImage(url: URL(string: self.getProfileImageUrl(item.profile_path)))
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 80, height:120)
                                //.aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .clipped()
                                .cornerRadius(5)
                            
                            Text("\(item.name ?? "")")
                                .font(.caption)
                                .fontWeight(.semibold)
                            Text("\(item.character ?? "")")
                                .font(.caption)
                                .fixedSize(horizontal: false, vertical: true)
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

struct TVShowDetailsCastSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsCastSwiftUIView()
    }
}
