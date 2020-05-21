//
//  PopularPersonCastCellSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 20/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct PopularPersonCastCellSwiftUIView: View {
    var personCast:combined_creditsCastDataModel?
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            ZStack {
                WebImage(url: URL(string: self.getImageUrl(personCast)))
                    .resizable()
                    .renderingMode(.original)
                    .placeholder(content: {
                        Image(systemName: "star")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                    })
                    .frame(width: 130, height: 185)
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(5)
                    .padding(.bottom,10)
                
                    
                    
            }
//            VStack(alignment: .leading, spacing: 3) {
//                Text(personCast?.original_title ?? "N/A")
//                    .fixedSize(horizontal: false, vertical: true)
//
//            }
//            .font(.callout)
//            .frame(width: 120)
//            .padding([.horizontal,.vertical], 5)
        }.foregroundColor(.white)
    }
    
    var getImageUrl:(combined_creditsCastDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct PopularPersonCastCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPersonCastCellSwiftUIView()
    }
}
