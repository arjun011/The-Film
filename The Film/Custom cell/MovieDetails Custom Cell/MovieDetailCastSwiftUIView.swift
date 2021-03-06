//
//  MovieDetailCastSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct MovieDetailCastSwiftUIView: View {
    var cast:castDataModel?
    var body: some View {
        
        VStack(alignment: .leading, content: {
            
            WebImage(url: URL(string: self.getProfileImageUrl(cast?.profile_path)))
                .resizable()
                .renderingMode(.original)
                .placeholder(content: {
                    Image(systemName: "star")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                })
                .frame(width: 80, height:120)
            
                .scaledToFit()
                .clipped()
                .cornerRadius(5)
            
            Text("\(cast?.name ?? "")")
                .font(.caption)
                .fontWeight(.semibold)
            Text("\(cast?.character ?? "")")
                .font(.caption)
                .fixedSize(horizontal: false, vertical: true)
        }).foregroundColor(Color.white)
        
    }
    var getProfileImageUrl:(String?) -> String = {
        return imageBaseUrl + "h632" + ($0 ?? "")
    }
}

struct MovieDetailCastSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailCastSwiftUIView()
    }
}
