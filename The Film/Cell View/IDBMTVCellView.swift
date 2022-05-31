//
//  IDBMTVCellView.swift
//  The Film
//
//  Created by Arjun on 17/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI
struct IDBMTVCellView: View {
    var movieObject:TVShowDataModel!
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            ZStack {
                WebImage(url: URL(string: self.getImageUrl(movieObject)))
                    .resizable()
                    .renderingMode(.original)
                    .placeholder(content: {
                        Image(systemName: "star")
                        .foregroundColor(Color("placeHolderColor").opacity(0.4))
                            .font(.system(size: 35))
                    })
                    .indicator(.activity)
                    .frame(width: 160, height: 220, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .overlay(
                        VStack {
                            
                            HStack{
                                Spacer()
                                
                                Image(systemName: "ellipsis.circle.fill")
                                    .shadow(radius: 4)
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 10))
                                    .contextMenu{
                                        
                                        Button {
                                            
                                        } label: {
                                            HStack {
                                                Image(systemName: "list.bullet")
                                                Text("Add to list")
                                                
                                            }
                                        }
                                        
                                        Button {
                                            
                                        } label: {
                                            HStack {
                                                Image(systemName: "suit.heart")
                                                Text("Favorite")
                                            }
                                        }
                                        
                                        Button {
                                            
                                        } label: {
                                            HStack {
                                                Image(systemName: "bookmark")
                                                Text("Watchlist")
                                            }
                                        }
                                        
                                        Button {
                                            
                                        } label: {
                                            HStack {
                                                Image(systemName: "star")
                                                Text("Your rating")
                                            }
                                        }
     
                                    }.frame(width: 35, height: 35, alignment: .center)
                                    .offset(x: -5, y: 3)
                                // Draw Rating circel
                            }
                            
                            Spacer()
                            HStack{
                                Spacer()
                                // Draw Rating circel
                                VoteAverageCircleSwiftUIView(voteAverage: movieObject.vote_average ,circleFrame: (width: 30, height: 30)).padding(.trailing, 5)
                                    .offset(x: -5, y: 10)
                            }
                        }
                    )
            }
            Spacer()
            VStack(alignment: .leading, spacing: 3) {
                
                Text(movieObject.original_name ?? "")
                    .font(.system(size: 15, weight: .semibold))
                    .allowsTightening(true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(Helper.convertDateFormat(inputDate: movieObject.first_air_date ?? "" ))
                    .font(.system(size: 12, weight: .light))
                    .multilineTextAlignment(.leading)
                    
            }.padding([.horizontal,.bottom], 10)
            .foregroundColor(.black)
            
            
        }.frame(width: 160, height: 300, alignment: .center)
        .cornerRadius(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        

    }
    
    var getImageUrl:(TVShowDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct IDBMTVCellView_Previews: PreviewProvider {
    static var previews: some View {
        IDBMTVCellView()
    }
}
