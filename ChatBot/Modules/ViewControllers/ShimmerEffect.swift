//
//  ShimmerEffect.swift
//  ChatBot
//
//  Created by Mohd Kashif on 30/05/24.
//

import Foundation
import UIKit
import SwiftUI

struct ShimmerEffect:View {
//    @State var isAnimating=false
    private var animation:Animation{
        .easeInOut(duration: 2)
        .speed(2)
        .repeatForever(autoreverses: false)
    }
    @State var startPoint:UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint:UnitPoint = .init(x: 0, y: -0.2)
    var colors=[Color(uiColor: UIColor.systemGray5),Color(uiColor: UIColor.systemGray6), Color(uiColor: UIColor.systemGray5)]
    var body: some View {
        LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
            .onAppear{
                withAnimation(animation){
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
            }
    }
}


struct ShimmerEffect_Previews:PreviewProvider{
    static var previews: some View{
        ShimmerEffect()
    }
}
