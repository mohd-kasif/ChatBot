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
