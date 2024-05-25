//
//  Extensions.swift
//  ChatBot
//
//  Created by Mohd Kashif on 25/05/24.
//

import Foundation
import SwiftUI

extension View{
    func cornerRadius(_ radius: CFloat, corners:UIRectCorner)->some View{
        clipShape(RoundedCorner(radius: CGFloat(radius), corners: corners))
    }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
    static let assistantBackground = Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
}
