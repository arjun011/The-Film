//
//  TVShowDetailsCreatedbySwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct TVShowDetailsCreatedbySwiftUIView: View {
    var tvShowDetails:TVShowDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, content: {
            
            Text("Created")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .center, spacing: 15, content: {
                    ForEach(self.tvShowDetails?.created_by ?? [created_byDataModel](), id: \.id) { user in
                        
                        VStack(alignment: .leading, content: {
                            
                            WebImage(url: URL(string: self.getProfileImageUrl(user.profile_path)))
                                .resizable()
                                .renderingMode(.original)
                                .placeholder(content: {
                                    Image(systemName: "star")
                                        .foregroundColor(Color("placeHolderColor").opacity(0.4))
                                        .font(.system(size: 35))
                                })
                                .frame(width: 120, height:160)
                                .scaledToFit()
                                .clipped()
                                .cornerRadius(5)
                            
                            Text("\(user.name ?? "")")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
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

struct TVShowDetailsCreatedbySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsCreatedbySwiftUIView()
    }
}
