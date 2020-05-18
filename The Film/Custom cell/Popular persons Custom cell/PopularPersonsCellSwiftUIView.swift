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
            ZStack {
                WebImage(url: URL(string: self.getImageUrl(persons)))
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(5)
                    .padding(.bottom,10)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(persons?.name ?? "N/A")
                    .fontWeight(.semibold)
            }
            .font(.callout)
            .lineLimit(1)
            .padding([.horizontal,.vertical], 5)
        }.foregroundColor(.white)
    }
    
    var getImageUrl:(PersonsDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.profile_path ?? "")
    }
    
    var voteAvarage:(Float?) -> CGFloat = {
        return CGFloat(($0 ?? 1.0) / 10)
    }
}

struct PopularPersonsCellSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPersonsCellSwiftUIView()
    }
}
