//
//  IDBMCellView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI
struct IDBMCellView: View {
    var movieObject:MovieDataModel!
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
                
                Text(movieObject.title ?? "")
                    .font(.system(size: 15, weight: .semibold))
                    .allowsTightening(true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(Helper.convertDateFormat(inputDate: movieObject.release_date ?? "" ))
                    .font(.system(size: 12, weight: .light))
                    .multilineTextAlignment(.leading)
                    
            }.padding([.horizontal,.bottom], 10)
            .foregroundColor(.black)
            
            
        }.frame(width: 160, height: 300, alignment: .center)
        .cornerRadius(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        

    }
    
    var getImageUrl:(MovieDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct IDBMCellView_Previews: PreviewProvider {
    
    static let move = MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 63649, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15")
    
    static var previews: some View {
        
        IDBMCellView(movieObject: move)
    }
}
