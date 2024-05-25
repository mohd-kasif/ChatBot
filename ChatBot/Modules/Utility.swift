//
//  Utility.swift
//  ChatBot
//
//  Created by Mohd Kashif on 25/05/24.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var body: some View {
        HStack {
            textField
            }
            .padding()
            .foregroundColor(.black)
            .background(Color.background)
            .cornerRadius(4)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)

        }
}
