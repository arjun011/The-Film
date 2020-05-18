//
//  TVShowDetailsHeaderSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct TVShowDetailsHeaderSwiftUIView: View {
    var tvShowDetails:TVShowDetailsDataModel?
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(self.tvShowDetails?.name ?? "")
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                
            Text(self.tvShowDetails?.first_air_date ?? "")
            Text(self.tvShowDetails?.status ?? "")
            
            ScrollView(.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(self.tvShowDetails?.genres ?? [genresDataModel]() , id: \.id) { genres in
                                 Text("\(genres.name ?? ""), ")
                             }.font(.callout)
                         }
                     }

        }
    }
}

struct TVShowDetailsHeaderSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsHeaderSwiftUIView()
    }
}
