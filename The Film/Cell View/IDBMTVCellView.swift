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
                    .placeholder(Image(systemName: "photo"))
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
                
                Text(Helper.convertDateFormat(inputDate: movieObject.first_air_date ?? "" ))
                    .font(.system(size: 12, weight: .light))
                    
            }.padding([.horizontal,.bottom], 10)
            
            
        }.frame(width: 160, height: 300, alignment: .center)
        .cornerRadius(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        

    }
    
    var getImageUrl:(TVShowDataModel?) -> String = {
        print(imageBaseUrl + "w342" + ($0?.poster_path ?? ""))
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
}

struct IDBMTVCellView_Previews: PreviewProvider {
    static var previews: some View {
        IDBMTVCellView()
    }
}
