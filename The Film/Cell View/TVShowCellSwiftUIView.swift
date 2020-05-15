//
//  TVShowCellSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 11/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI
struct TVShowCellSwiftUIView: View {
    var movieObject:TVShowDataModel?
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            ZStack {
                WebImage(url: URL(string: self.getImageUrl(movieObject)))
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(5)
                    .padding(.bottom,10)
                
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .stroke(Color.gray,style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap.round))
                                .frame(width: 35,height: 35)
                            
                            Circle()
                                .fill(Color.black)
                                .frame(width: 31,height: 31)
                            
                            Circle()
                                .trim(from: 0, to: voteAvarage(movieObject?.vote_average))
                                .stroke(Color.white,style: StrokeStyle(lineWidth: 4, lineCap: CGLineCap.round))
                                .frame(width: 35, height: 35 )
                                .rotationEffect(.degrees(-90))
                                .overlay(
                                    Text(String(format: "%.1f", (movieObject?.vote_average ?? 1.0)))
                                        .font(.system(size: 11))
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                            )
                        }.padding(.trailing, 5)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(movieObject?.name ?? "N/A")
                    .fontWeight(.semibold)
                Text(movieObject?.first_air_date ?? "N/A")
                    .foregroundColor(.gray)
            }
            .font(.callout)
            .lineLimit(1)
            .padding([.horizontal,.vertical], 5)
        }.foregroundColor(.white)
    }
    
    var getImageUrl:(TVShowDataModel?) -> String = {
        print(imageBaseUrl + "w342" + ($0?.poster_path ?? ""))
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
    
    var voteAvarage:(Float?) -> CGFloat = {
        return CGFloat(($0 ?? 1.0) / 10)
    }
}

struct TVShowCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowCellSwiftUIView()
    }
}
