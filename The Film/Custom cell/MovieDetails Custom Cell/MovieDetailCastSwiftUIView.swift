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
                        .foregroundColor(Color("placeHolderColor").opacity(0.4))
                        .font(.system(size: 35))
                })
                .frame(width: 130, height:170)
                .scaledToFit()
                .clipped()
                .cornerRadius(6)
            
            
        }).foregroundColor(Color.black)
        
        
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
