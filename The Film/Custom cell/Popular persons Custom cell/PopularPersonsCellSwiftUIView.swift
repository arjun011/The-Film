//
//  PopularPersonsCellSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct PopularPersonsCellSwiftUIView: View {
    var persons:PersonsDataModel?
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            
            WebImage(url: URL(string: self.getImageUrl(persons)))
                    .resizable()
                    .renderingMode(.original)
                    .placeholder(content: {
                                           Image(systemName: "star")
                                               .foregroundColor(.white)
                                               .font(.system(size: 35))
                                       })
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.bottom,10)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(persons?.name ?? "N/A")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .allowsTightening(true)
                    .lineLimit(1)
            }
            .padding([.horizontal,.vertical], 10)
            
        }.cornerRadius(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
    }
    
    var getImageUrl:(PersonsDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.profile_path ?? "")
    }
}

struct PopularPersonsCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPersonsCellSwiftUIView()
    }
}
