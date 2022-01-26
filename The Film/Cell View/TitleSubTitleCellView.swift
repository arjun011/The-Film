//
//  TitleSubTitleCellView.swift
//  The Film
//
//  Created by Arjun on 26/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct TitleSubTitleCellView: View {
    var title:String?
    var subTitle:String?
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title ?? "")
                .font(.system(size: 15, weight: .bold))
           
            Text(subTitle ?? "")
                .font(.system(size: 12, weight: .regular))
        }
    }
}

struct TitleSubTitleCellView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSubTitleCellView()
    }
}
