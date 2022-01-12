//
//  VoteAverageSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 13/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct VoteAverageCircleSwiftUIView: View {
    var voteAverage:Float?
    var voteAverageNumber:CGFloat? {
        return CGFloat((voteAverage ?? 1.0) / 10)
    }
    var circleFrame:(width: CGFloat, height: CGFloat)
    
    private var fillColor: Color {
        get {
            let fillColor = [Color.green, Color.yellow]
            return fillColor.randomElement() ?? Color.green
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray,style: StrokeStyle(lineWidth: 3.0, lineCap: CGLineCap.round))
                .frame(width: self.circleFrame.width ,height: self.circleFrame.height)
            
            Circle()
                .fill(Color.black)
                .frame(width: (self.circleFrame.width - 4),height: (self.circleFrame.height - 4))
            
            Circle()
                .trim(from: 0, to: voteAverageNumber ?? 0.1)
                .stroke(fillColor ,style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round))
                .frame(width: self.circleFrame.width ,height: self.circleFrame.height)
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text(String(format: "%.1f", voteAverageNumber ?? 0.1))
                        .font(.system(size: 11))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
            )
        }
    }
}

struct VoteAverageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VoteAverageCircleSwiftUIView(voteAverage: 5.1,circleFrame: (width: 35, height: 35))
    }
}
